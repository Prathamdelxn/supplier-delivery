import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String?> uploadImageToCloudinaryWithSignature({
  required File imageFile,
}) async {
  final cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME']!;
  final apiKey = dotenv.env['CLOUDINARY_API_KEY']!;
  final apiSecret = dotenv.env['CLOUDINARY_API_SECRET']!;
  const folder = 'category';

  final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final signatureData = 'folder=$folder&timestamp=$timestamp$apiSecret';
  final signature = sha1.convert(utf8.encode(signatureData)).toString();

  final url = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");

  final request = http.MultipartRequest("POST", url)
    ..fields['api_key'] = apiKey
    ..fields['timestamp'] = timestamp.toString()
    ..fields['folder'] = folder
    ..fields['signature'] = signature
    ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

  final response = await request.send();

  if (response.statusCode == 200) {
    final respStr = await response.stream.bytesToString();
    final data = json.decode(respStr);
    return data['secure_url'];
  } else {
    print("❌ Upload failed: ${response.statusCode}");
    return null;
  }
}
