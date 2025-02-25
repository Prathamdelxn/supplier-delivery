import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'MapScreen.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  File? _image;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _whatsappNumberController = TextEditingController();
  final TextEditingController _businessTypeController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Function to pick an image from gallery
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _openMapBottomSheet() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow full-screen height
      builder: (context) {
        return MapBottomSheet(
          onLocationSelected: (String address) {
            setState(() {
              _addressController.text = address;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xF2F8FAFF),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Personal Information",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
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
                "Enter the details below so we can get to know and serve you better",
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              SizedBox(height: 16),
              Text(
                "Your Profile Picture",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: _image != null ? FileImage(_image!) : null,
                      child: _image == null ? Icon(Icons.person_outline, color: Colors.blue, size: 30) : null,
                    ),
                    SizedBox(width: 12),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onPressed: pickImage,
                      icon: Icon(Icons.camera_alt, color: Colors.blue),
                      label: Text("Upload Photo"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildInputField("Full Name", "Please enter full name", _fullNameController, prefixIcon: Icon(Icons.person_outline, color: Colors.blue)),
              _buildInputField("WhatsApp Number", "+91 9999988888", _whatsappNumberController, prefixIcon: Icon(Icons.perm_phone_msg_outlined, color: Colors.blue)),
              _buildInputField("Business Type", "e.g. Grocery", _businessTypeController, prefixIcon: Icon(Icons.business, color: Colors.blue)),
              _buildInputField("Shop Name", "e.g. Prakash Mart", _shopNameController, prefixIcon: Icon(Icons.local_shipping_outlined, color: Colors.blue)),
              _buildInputField("Enter complete address here", "Search address", _addressController,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.location_on_outlined),
                    onPressed: _openMapBottomSheet,
                  )),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                //   height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 132, 195, 246),
                      Color.fromARGB(255, 1, 89, 242)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    log("Full Name: ${_fullNameController.text}");
                    log("WhatsApp Number: ${_whatsappNumberController.text}");
                    log("Business Type: ${_businessTypeController.text}");
                    log("Shop Name: ${_shopNameController.text}");
                    log("Address: ${_addressController.text}");

                    Navigator.pushNamed(context, "/homeScreen");
                    _fullNameController.clear();
                    _whatsappNumberController.clear();
                    _businessTypeController.clear();
                    _shopNameController.clear();
                    _addressController.clear();
                    _image = null;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hintText, TextEditingController controller, {Widget? suffixIcon, Widget? prefixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _whatsappNumberController.dispose();
    _businessTypeController.dispose();
    _shopNameController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
