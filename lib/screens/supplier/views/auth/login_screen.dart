import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplier_dashboard/NavigationPages.dart';
import 'package:supplier_dashboard/screens/supplier/api/auth_api.dart';
import 'package:supplier_dashboard/screens/supplier/providers/auth_provider.dart';

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
  bool isLoading = false;
  final FocusNode emailFocusNode =
      FocusNode(); // Focus node for the email field

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  void loginSupplier() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await AuthApi.login(emailController.text, passwordController.text);
    print(response);
    setState(() {
      isLoading = false;
    });
    if (response["success"] == true) {
      String userId = response["supplier"]["_id"];
      String userEmail = response["supplier"]["supplierEmail"];
      String token = response["token"];
      Provider.of<AuthProvider>(context, listen: false)
          .login(userId, userEmail, token);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Registration Successful!"),
            backgroundColor: Colors.green),
      );
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => NavigationPage()), (Route<dynamic> route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(response["message"]), backgroundColor: Colors.red),
      );
    }
  }

  // Function to toggle keyboard type
  void toggleKeyboardType() {
    setState(() {
      isNumericKeyboard = !isNumericKeyboard;
    });

    // Unfocus the current field to refresh the keyboard
    FocusScope.of(context).unfocus();

    // Refocus after a short delay
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
                      "assets/images/fflogo.png",
                      width: 230,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
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
                              keyboardType: isNumericKeyboard
                                  ? TextInputType.number
                                  : TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: isNumericKeyboard
                                    ? 'Number'
                                    : 'Email', // Dynamic label
                                prefixIcon: Icon(
                                  isNumericKeyboard
                                      ? Icons.phone
                                      : Icons.email_outlined, // Dynamic icon
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
                                isNumericKeyboard
                                    ? Icons.keyboard
                                    : Icons.dialpad,
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
                              isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                            Navigator.of(context)
                                .pushNamed('/forgotPasswordScreen');
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
                          loginSupplier();
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
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
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
                                Navigator.of(context)
                                    .pushNamed('/registerScreen');
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
