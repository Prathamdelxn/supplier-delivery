import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isNumericKeyboard = false;
  bool isPasswordVisible = false;
  final FocusNode emailFocusNode = FocusNode();

  void registerSupplier() async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email is required')));
      return;
    }
    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password is required')));
      return;
    }
    if (confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Confirm Password is required')));
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password and Confirm Password should be same')));
      return;
    }

    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty) {
      var reqBody = {
        'email': emailController.text,
        'password': passwordController.text
      };

      var response = await http.post(
        Uri.parse(registration),
        body: jsonEncode(reqBody),
        headers: {
          'Content-Type': 'application/json'
        },
      );

      log(response.body);

      if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Supplier Email already exists')));
        return;
      }

      log("${response.statusCode}");
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Supplier Registered Successfully')));
        Navigator.of(context).pushNamedAndRemoveUntil('/loginScreen', (route) => false);
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  void toggleKeyboardType() {
    setState(() {
      isNumericKeyboard = !isNumericKeyboard;
    });

    FocusScope.of(context).unfocus();

    Future.delayed(const Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    Image.asset(
                      "assets/images/logo.png",
                      width: 230,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Register',
                      style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: emailController,
                              focusNode: emailFocusNode, // Attach focus node
                              keyboardType: isNumericKeyboard ? TextInputType.number : TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: isNumericKeyboard ? 'Number' : 'Email', // Dynamic label
                                prefixIcon: Icon(
                                  isNumericKeyboard ? Icons.phone : Icons.email_outlined, // Dynamic icon
                                  color: Colors.blue,
                                ),
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                            ),
                            child: IconButton(
                              onPressed: toggleKeyboardType,
                              icon: Icon(
                                isNumericKeyboard ? Icons.keyboard : Icons.dialpad,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.blue,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: TextField(
                        controller: confirmPasswordController,
                        obscureText: !isPasswordVisible,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.blue,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
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
                          // Navigator.of(context).pushNamed('/otpScreen');
                          registerSupplier();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Verify OTP/Submit",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                        children: [
                          const TextSpan(text: 'Already have an account? '),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
