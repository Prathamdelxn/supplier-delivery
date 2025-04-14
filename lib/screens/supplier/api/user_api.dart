import './api_client.dart';
import './endpoints.dart';

class UserApi {
  // Fetch User Profile
  static Future<Map<String, dynamic>> getUserProfile(String token) async {
    return await ApiClient.request(Endpoints.getUser, "GET", token: token);
  }

  // Update User Profile
  static Future<Map<String, dynamic>> updateUserProfile(
      String token, String name, String phone) async {
    return await ApiClient.request(Endpoints.updateUser, "PUT",
        body: {"name": name, "phone": phone}, token: token);
  }
}
