import "./api_client.dart";
import './endpoints.dart';

class AuthApi {
  // Register User
  static Future<Map<String, dynamic>> register(String email, String password) async {
    return await ApiClient.request(Endpoints.register, "POST", body: {
      "supplierEmail": email,
      "supplierPassword": password,
    });
  }

  // Login User
  static Future<Map<String, dynamic>> login(String email, String password) async {
    return await ApiClient.request(Endpoints.login, "POST", body: {
      "supplierEmail": email,
      "supplierPassword": password,
    });
  }
}



//
