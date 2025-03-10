import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../profile/personal_info.dart';
import 'config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isNumericKeyboard = false;
  bool isPasswordVisible = false;
  final FocusNode emailFocusNode = FocusNode();
  late SharedPreferences prefs;

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        'email': emailController.text,
        'password': passwordController.text
      };

      var response = await http.post(
        Uri.parse(login),
        body: jsonEncode(reqBody),
        headers: {
          'Content-Type': 'application/json'
        },
      );

      log(response.statusCode.toString());
      if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Supplier Email dosn't exists")));
        return;
      }

      var jsonResponse = jsonDecode(response.body);
      log(jsonResponse['status'].toString());
      if (jsonResponse['status']) {
        var myToken = jsonResponse['token'];
        await prefs.setString('token', myToken);

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
          return PersonalInfoScreen(
            token: myToken,
          );
        }), (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid Credentials')));
      }
    }
  }

  Future<void> _initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initializePrefs();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                      'Login',
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
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/forgotPasswordScreen');
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
                          loginUser();
                          // Navigator.of(context).pushNamed('/navigationScreen');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        children: [
                          TextSpan(text: 'Click here to '),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/registerScreen');
                              },
                              child: Text(
                                'Sign Up',
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
