import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> saveUserData(String id, String email, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("userId", id);
    await prefs.setString("userEmail", email);
    await prefs.setString("authToken", token);
  }

  static Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "userId": prefs.getString("userId"),
      "userEmail": prefs.getString("userEmail"),
      "authToken": prefs.getString("authToken"),
    };
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
