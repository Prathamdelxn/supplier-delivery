// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static const String baseUrl = "https://farmferry-backend.onrender.com/"; // Replace with your backend URL

//   // Register User API Call
//   static Future<Map<String, dynamic>> registerUser(String email, String password) async {
//     final url = Uri.parse('$baseUrl/api/register'); // Your API endpoint

//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode({
//           "email": email,
//           "password": password,
//         }),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         return {"success": false, "message": "Registration failed"};
//       }
//     } catch (e) {
//       return {"success": false, "message": "Error: $e"};
//     }
//   }
// }


// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiClient {
//   static const String baseUrl = "https://farmferry-backend.onrender.com";

//   // Function to send requests
//   static Future<Map<String, dynamic>> request(
//       String endpoint, String method, {Map<String, dynamic>? body, String? token}) async {
//     final url = Uri.parse('$baseUrl$endpoint');

//     final headers = {
//       "Content-Type": "application/json",
//       if (token != null) "Authorization": "Bearer $token",
//     };

//     http.Response response;
//     try {
//       if (method == 'POST') {
//         response = await http.post(url, headers: headers, body: jsonEncode(body));
//       } else if (method == 'GET') {
//         response = await http.get(url, headers: headers);
//       } else if (method == 'PUT') {
//         response = await http.put(url, headers: headers, body: jsonEncode(body));
//       } else if (method == 'DELETE') {
//         response = await http.delete(url, headers: headers);
//       } else {
//         throw Exception('Invalid HTTP method');
//       }

//       final data = jsonDecode(response.body);
//       return data;
//     } catch (e) {
//       return {"success": false, "message": "Error: $e"};
//     }
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';

class ApiClient {
  static const String baseUrl = "https://farmferry-backend.onrender.com";

  // Function to send requests
  static Future<Map<String, dynamic>> request(
      String endpoint, String method, {Map<String, dynamic>? body, String? token}) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };

    http.Response response;
    
    try {
      log("Making API request: $method $url");
      log("Request Headers: $headers");
      if (body != null) log("Request Body: ${jsonEncode(body)}");

      switch (method.toUpperCase()) {
        case 'POST':
          response = await http.post(url, headers: headers, body: jsonEncode(body));
          break;
        case 'GET':
          response = await http.get(url, headers: headers);
          break;
        case 'PUT':
          response = await http.put(url, headers: headers, body: jsonEncode(body));
          break;
        case 'PATCH':
          response = await http.patch(url, headers: headers, body: jsonEncode(body));
          break;
        case 'DELETE':
          response = await http.delete(url, headers: headers);
          break;
        default:
          throw Exception('Invalid HTTP method: $method');
      }

      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.body}");

      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      log("API Request Failed: $e");
      return {"success": false, "message": "Error: $e"};
    }
  }
}
