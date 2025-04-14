import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supplier_dashboard/screens/supplier/api/api_client.dart';
import '../services/storage_service.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userId;
  String? _userEmail;

  Map<String, dynamic>? _supplierData;

  String? get token => _token;
  String? get userId => _userId;
  String? get userEmail => _userEmail;
  bool get isAuthenticated => _token != null;
    Map<String, dynamic>? get supplierData => _supplierData;

  Future<void> loadUserData() async {
    final userData = await StorageService.getUserData();
    _userId = userData["userId"];
    _userEmail = userData["userEmail"];
    _token = userData["authToken"];
    notifyListeners();
  }

  Future<void> login(String id, String email, String token) async {
    await StorageService.saveUserData(id, email, token);
    print("done data is goint for store");
    _userId = id;
    _userEmail = email;
    _token = token;
    notifyListeners();
  }

//logout

Future<void> logout(BuildContext context) async {
  try {
    await StorageService.clearUserData(); // Clear SharedPreferences
    _userId = null;
    _userEmail = null;
    _token = null;
    _supplierData = null;
    notifyListeners(); // Notify UI

    log("User logged out successfully.");

    // Navigate to Login Screen (Replace 'LoginScreen' with your actual screen)
    Navigator.pushNamedAndRemoveUntil(context,'/loginScreen', (route) => false);
  } catch (e) {
    log("Error during logout: $e");
  }
}


  // Future<void> logout() async {
  //   await StorageService.clearUserData();
  //   _userId = null;
  //   _userEmail = null;
  //   _token = null;
  //   notifyListeners();
  // }

  // ✅ **Function to Add New Fields to Supplier**
  // Future<bool> addNewSupplierFields(Map<String, dynamic> newFields) async {
  //   if (_userId == null || _token == null) return false;
  //   log(" $_userId,$newFields");
  //   final response = await ApiClient.request(
  //     "/api/v1/updateSupplier/$_userId",
  //     "PUT",
  //     body: newFields, // Send only the new fields to API
  //     // token: _token,
  //   );

  //   if (response["success"] == true) {
  //     notifyListeners();
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }


//Fetch Supplier Details

Future<void> fetchSupplierData() async{

   if (_userId == null || _token == null) {
      log("User ID or Token is missing. Cannot fetch supplier details.");
      return;
    }
 final String url = "/api/v1/getSupplierById/$_userId";
    log("Fetching supplier data from: $url");

    try {
      final response = await ApiClient.request(url, "GET", token: _token);
      log("API Response: $response");

      if (response["supplierName"] != null) {
        _supplierData = response;
        notifyListeners();
      } else {
        log("Failed to fetch supplier data. Response: $response");
      }
    } catch (e) {
      log("Error fetching supplier data: $e");
    }
}



  Future<bool> addNewSupplierFields(Map<String, dynamic> newFields) async {
    // Check if userId and token are available
    if (_userId == null || _token == null) {
      log("User ID or Token is missing. User ID: $_userId, Token: $_token");
      return false;
    }

    log("Updating supplier fields for User ID: $_userId");
    log("Data being sent: $newFields");

    try {
      // Make the API call
      final response = await ApiClient.request(
        "/api/v1/updateSupplier/$_userId",
        "PATCH",
        body: newFields,
        token: _token, // Ensure the token is sent for authentication
      );

      // Log the API response
      log("API Response: $response");

      // Check if the response indicates success
      if (response["message"]=="Supplier updated successfully.") {
        log("Supplier fields updated successfully");
        notifyListeners(); // Notify listeners if needed
        return true;
      } else {
        log("Failed to update supplier fields. Response: $response");
        return false;
      }
    } catch (e) {
      // Handle any exceptions
      log("Error in addNewSupplierFields: $e");
      return false;
    }
  }
}
