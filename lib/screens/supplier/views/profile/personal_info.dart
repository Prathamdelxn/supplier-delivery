// // import 'dart:developer';
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:provider/provider.dart';
// // import 'package:supplier_dashboard/screens/supplier/providers/auth_provider.dart';

// // import 'MapScreen.dart';

// // class PersonalInfoScreen extends StatefulWidget {
// //   const PersonalInfoScreen({super.key});

// //   @override
// //   State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
// // }

// // class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
// //   File? _image;

// //   final TextEditingController _fullNameController = TextEditingController();
// //   final TextEditingController _whatsappNumberController = TextEditingController();
// //   final TextEditingController _businessTypeController = TextEditingController();
// //   final TextEditingController _shopNameController = TextEditingController();
// //   final TextEditingController _addressController = TextEditingController();

// //   // Function to pick an image from gallery
// //   Future<void> pickImage() async {
// //     final ImagePicker picker = ImagePicker();
// //     final XFile? image = await picker.pickImage(source: ImageSource.gallery);

// //     if (image != null) {
// //       setState(() {
// //         _image = File(image.path);
// //       });
// //     }
// //   }
// //  void addNewFields() async {
// //     final authProvider = Provider.of<AuthProvider>(context, listen: false);

// //     bool success = await authProvider.addNewSupplierFields({
// //       "supplierPhone": _whatsappNumberController.text,
// //       "supplierName": _fullNameController.text,
// //     });

// //     if (success) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("New fields added successfully"), backgroundColor: Colors.green),
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Failed to add new fields"), backgroundColor: Colors.red),
// //       );
// //     }
// //   }
// //   Future<void> _openMapBottomSheet() async {
// //     showModalBottomSheet(
// //       context: context,
// //       isScrollControlled: true, // Allow full-screen height
// //       builder: (context) {
// //         return MapBottomSheet(
// //           onLocationSelected: (String address) {
// //             setState(() {
// //               _addressController.text = address;
// //             });
// //           },
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // backgroundColor: Color(0xF2F8FAFF),
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //         title: Text(
// //           "Create New Account",
// //           style: TextStyle(
// //             color: Colors.black,
// //             fontSize: 24,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         centerTitle: false,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back_ios, color: Colors.black),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 "Enter the details below so we can get to know and serve you better",
// //                 style: TextStyle(color: Colors.black54, fontSize: 15),
// //               ),
// //               SizedBox(height: 16),
// //               Text(
// //                 "Your Profile Picture",
// //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
// //               ),
// //               SizedBox(height: 8),
// //               Container(
// //                 padding: EdgeInsets.all(10),
// //                 decoration: BoxDecoration(
// //                   border: Border.all(color: Colors.grey.shade300),
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 child: Row(
// //                   children: [
// //                     CircleAvatar(
// //                       radius: 32,
// //                       backgroundColor: Colors.grey.shade300,
// //                       backgroundImage: _image != null ? FileImage(_image!) : null,
// //                       child: _image == null ? Icon(Icons.person_outline, color: Colors.blue, size: 30) : null,
// //                     ),
// //                     SizedBox(width: 12),
// //                     ElevatedButton.icon(
// //                       style: ElevatedButton.styleFrom(
// //                         foregroundColor: Colors.blue,
// //                         backgroundColor: Colors.white,
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(5),
// //                           side: BorderSide(color: Colors.blue),
// //                         ),
// //                       ),
// //                       onPressed: pickImage,
// //                       icon: Icon(Icons.camera_alt, color: Colors.blue),
// //                       label: Text("Upload Photo"),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //               _buildInputField("Full Name", "Please enter full name", _fullNameController, prefixIcon: Icon(Icons.person_outline, color: Colors.blue)),
// //               _buildInputField("WhatsApp Number", "+91 9999988888", _whatsappNumberController, prefixIcon: Icon(Icons.perm_phone_msg_outlined, color: Colors.blue)),
// //               _buildInputField("Business Type", "e.g. Grocery", _businessTypeController, prefixIcon: Icon(Icons.business, color: Colors.blue)),
// //               _buildInputField("Shop Name", "e.g. Prakash Mart", _shopNameController, prefixIcon: Icon(Icons.local_shipping_outlined, color: Colors.blue)),
// //               _buildInputField("Enter complete address here", "Search address", _addressController,
// //                   suffixIcon: IconButton(
// //                     icon: Icon(Icons.location_on_outlined),
// //                     onPressed: _openMapBottomSheet,
// //                   )),
// //               SizedBox(height: 20),
// //               Container(
// //                 width: double.infinity,
// //                 //   height: 60,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(10),
// //                   gradient: const LinearGradient(
// //                     colors: [
// //                       Color.fromARGB(255, 132, 195, 246),
// //                       Color.fromARGB(255, 1, 89, 242)
// //                     ],
// //                     begin: Alignment.topCenter,
// //                     end: Alignment.bottomCenter,
// //                   ),
// //                 ),
// //                 child: ElevatedButton(
// //                   onPressed: () {
// //                     log("Full Name: ${_fullNameController.text}");
// //                     log("WhatsApp Number: ${_whatsappNumberController.text}");
// //                     log("Business Type: ${_businessTypeController.text}");
// //                     log("Shop Name: ${_shopNameController.text}");
// //                     log("Address: ${_addressController.text}");

// //                     Navigator.pushNamed(context, "/homeScreen");
// //                     _fullNameController.clear();
// //                     _whatsappNumberController.clear();
// //                     _businessTypeController.clear();
// //                     _shopNameController.clear();
// //                     _addressController.clear();
// //                     _image = null;
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.transparent,
// //                     shadowColor: Colors.transparent,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                   ),
// //                   child: const Text(
// //                     "SignUp",
// //                     style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildInputField(String label, String hintText, TextEditingController controller, {Widget? suffixIcon, Widget? prefixIcon}) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
// //         ),
// //         SizedBox(height: 8),
// //         TextField(
// //           controller: controller,
// //           decoration: InputDecoration(
// //             hintText: hintText,
// //             filled: true,
// //             fillColor: Colors.white,
// //             enabledBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(8),
// //               borderSide: BorderSide(color: Colors.blue, width: 2),
// //             ),
// //             focusedBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(8),
// //               borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
// //             ),
// //             errorBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(8),
// //               borderSide: BorderSide(color: Colors.red, width: 2),
// //             ),
// //             suffixIcon: suffixIcon,
// //             prefixIcon: prefixIcon,
// //             contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
// //           ),
// //         ),
// //         SizedBox(height: 12),
// //       ],
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _fullNameController.dispose();
// //     _whatsappNumberController.dispose();
// //     _businessTypeController.dispose();
// //     _shopNameController.dispose();
// //     _addressController.dispose();
// //     super.dispose();
// //   }
// // }

// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:supplier_dashboard/screens/supplier/providers/auth_provider.dart';
// import 'MapScreen.dart';

// class PersonalInfoScreen extends StatefulWidget {
//   const PersonalInfoScreen({super.key});

//   @override
//   State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
// }

// class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
//   File? _image;

//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _whatsappNumberController = TextEditingController();
//   final TextEditingController _businessTypeController = TextEditingController();
//   final TextEditingController _shopNameController = TextEditingController();

//   final TextEditingController _streetController = TextEditingController();
//   final TextEditingController _cityController = TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//   final TextEditingController _countryController = TextEditingController();
//   final TextEditingController _pincodeController = TextEditingController();

//   // Function to pick an image from gallery
//   Future<void> pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       setState(() {
//         _image = File(image.path);
//       });
//     }
//   }

//   Future<void> _openMapBottomSheet() async {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true, // Allow full-screen height
//       builder: (context) {
//         return MapBottomSheet(
//           onLocationSelected: (String address) {
//             setState(() {
//               List<String> addressParts = address.split(', ');
//               _streetController.text = addressParts.isNotEmpty ? addressParts[0] : "";
//               _cityController.text = addressParts.length > 1 ? addressParts[1] : "";
//               _stateController.text = addressParts.length > 2 ? addressParts[2] : "";
//               _countryController.text = addressParts.length > 3 ? addressParts[3] : "";
//               _pincodeController.text = addressParts.length > 4 ? addressParts[4] : "";
//             });
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           "Create New Account",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: false,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Enter the details below so we can get to know and serve you better",
//                 style: TextStyle(color: Colors.black54, fontSize: 15),
//               ),
//               SizedBox(height: 16),

//               /// **Profile Picture Upload**
//               Text(
//                 "Your Profile Picture",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 32,
//                     backgroundColor: Colors.grey.shade300,
//                     backgroundImage: _image != null ? FileImage(_image!) : null,
//                     child: _image == null ? Icon(Icons.person_outline, color: Colors.blue, size: 30) : null,
//                   ),
//                   SizedBox(width: 12),
//                   ElevatedButton.icon(
//                     onPressed: pickImage,
//                     icon: Icon(Icons.camera_alt, color: Colors.blue),
//                     label: Text("Upload Photo"),
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.blue,
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         side: BorderSide(color: Colors.blue),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),

//               /// **Text Fields for Personal Info**
//               _buildInputField("Full Name", "Please enter full name", _fullNameController, prefixIcon: Icon(Icons.person_outline, color: Colors.blue)),
//               _buildInputField("WhatsApp Number", "+91 9999988888", _whatsappNumberController, prefixIcon: Icon(Icons.perm_phone_msg_outlined, color: Colors.blue)),
//               _buildInputField("Business Type", "e.g. Grocery", _businessTypeController, prefixIcon: Icon(Icons.business, color: Colors.blue)),
//               _buildInputField("Shop Name", "e.g. Prakash Mart", _shopNameController, prefixIcon: Icon(Icons.store, color: Colors.blue)),

//               /// **Text Fields for Address**
//               Divider(height: 30, thickness: 1, color: Colors.grey.shade300),
//               Text(
//                 "Address Details",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//               SizedBox(height: 10),
//               _buildInputField("Street", "Enter street name", _streetController, prefixIcon: Icon(Icons.location_on_outlined, color: Colors.blue)),
//               _buildInputField("City", "Enter city", _cityController),
//               _buildInputField("State", "Enter state", _stateController),
//               _buildInputField("Country", "Enter country", _countryController),
//               _buildInputField("Pincode", "Enter pincode", _pincodeController),

//               /// **Address Picker Button**
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton.icon(
//                   onPressed: _openMapBottomSheet,
//                   icon: Icon(Icons.map_outlined, color: Colors.blue),
//                   label: Text("Pick from Map", style: TextStyle(color: Colors.blue)),
//                 ),
//               ),

//               SizedBox(height: 20),

//               /// **Sign Up Button**
//               ElevatedButton(
//                 onPressed: () {
//                   log("Full Name: ${_fullNameController.text}");
//                   log("WhatsApp Number: ${_whatsappNumberController.text}");
//                   log("Business Type: ${_businessTypeController.text}");
//                   log("Shop Name: ${_shopNameController.text}");
//                   log("Street: ${_streetController.text}");
//                   log("City: ${_cityController.text}");
//                   log("State: ${_stateController.text}");
//                   log("Country: ${_countryController.text}");
//                   log("Pincode: ${_pincodeController.text}");

//                   Navigator.pushNamed(context, "/homeScreen");
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                 ),
//                 child: Text("Sign Up", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField(String label, String hintText, TextEditingController controller, {Widget? prefixIcon}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           hintText: hintText,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//           prefixIcon: prefixIcon,
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:supplier_dashboard/NavigationPages.dart';
import 'package:supplier_dashboard/screens/supplier/providers/auth_provider.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  File? _image;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _whatsappNumberController =
      TextEditingController();
  final TextEditingController _businessTypeController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();

  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  // void updatePersonalInfo() async {
  //   final authProvider = Provider.of<AuthProvider>(context, listen: false);

  //   Map<String, dynamic> updatedData = {
  //     "supplierPhone": _whatsappNumberController.text,
  //     "supplierName": _fullNameController.text,
  //     "profile": {
  //       "businessType": _businessTypeController.text,
  //       "supplierShop_name": _shopNameController.text,
  //     },
  //     "supplierAddress": {
  //       "street": _streetController.text,
  //       "city": _cityController.text,
  //       "state": _stateController.text,
  //       "country": _countryController.text,
  //       "pincode": _pincodeController.text,
  //     },
  //   };
  //   log("$updatedData");
  //   bool success = await authProvider.addNewSupplierFields(updatedData);

  //   if (success) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //           content: Text("Supplier details updated successfully"),
  //           backgroundColor: Colors.green),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //           content: Text("Failed to update details"),
  //           backgroundColor: Colors.red),
  //     );
  //   }
  // }
  void updatePersonalInfo() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    Map<String, dynamic> updatedData = {
      "supplierPhone": _whatsappNumberController.text.trim(),
      "supplierName": _fullNameController.text.trim(),
  
        "supplierBusiness_type": _businessTypeController.text.trim(),
        "supplierShop_name": _shopNameController.text.trim(),
         "address": {
        "street": _streetController.text.trim(),
        "city": _cityController.text.trim(),
        "state": _stateController.text.trim(),
        "country": _countryController.text.trim(),
        "pincode": _pincodeController.text.trim(),
      },
      
     
    };
    log("$updatedData");

    try {
      bool success = await authProvider.addNewSupplierFields(updatedData);
      print(success);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Supplier details updated successfully"),
              backgroundColor: Colors.green),
        );
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavigationPage()), (Route<dynamic> route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Failed to update details"),
              backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("An error occurred: ${e.toString()}"),
            backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Update Personal Info",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Update your details to help us serve you better",
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              SizedBox(height: 16),
              _buildProfileImage(),
              SizedBox(height: 20),
              _buildInputField("Full Name", "Enter full name",
                  _fullNameController, Icons.person),
              _buildInputField("WhatsApp Number", "+91 9999988888",
                  _whatsappNumberController, Icons.phone),
              _buildInputField("Business Type", "e.g. Grocery",
                  _businessTypeController, Icons.business),
              _buildInputField("Shop Name", "e.g. Prakash Mart",
                  _shopNameController, Icons.store),
              SizedBox(height: 16),
              Text("Address Information",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              _buildInputField("Street", "Enter street", _streetController,
                  Icons.location_on),
              _buildInputField(
                  "City", "Enter city", _cityController, Icons.location_city),
              _buildInputField(
                  "State", "Enter state", _stateController, Icons.map),
              _buildInputField(
                  "Country", "Enter country", _countryController, Icons.public),
              _buildInputField(
                  "Pincode", "Enter pincode", _pincodeController, Icons.pin),
              SizedBox(height: 20),
              _buildUpdateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Profile Picture",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 8),
        Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: _image != null ? FileImage(_image!) : null,
              child: _image == null
                  ? Icon(Icons.person_outline, color: Colors.blue, size: 30)
                  : null,
            ),
            SizedBox(width: 12),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue, backgroundColor: Colors.white),
              onPressed: pickImage,
              icon: Icon(Icons.camera_alt, color: Colors.blue),
              label: Text("Upload Photo"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputField(String label, String hintText,
      TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon, color: Colors.blue),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Widget _buildUpdateButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Color(0xFF84C3F6), Color(0xFF0159F2)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ElevatedButton(
        onPressed: updatePersonalInfo,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text("Update",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20)),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _whatsappNumberController.dispose();
    _businessTypeController.dispose();
    _shopNameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }
}
