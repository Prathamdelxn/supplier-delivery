// import 'package:flutter/material.dart';
// import 'package:supplier_dashboard/screens/supplier/views/profile/personal_info.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   bool isNumericKeyboard = false;
//   bool isPasswordVisible = false;
//   final FocusNode emailFocusNode = FocusNode(); // Focus node for the email field

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     emailFocusNode.dispose();
//     super.dispose();
//   }

//   // Function to toggle keyboard type
//   void toggleKeyboardType() {
//     setState(() {
//       isNumericKeyboard = !isNumericKeyboard;
//     });

//     // Unfocus the current field to refresh the keyboard
//     FocusScope.of(context).unfocus();

//     // Refocus after a short delay
//     Future.delayed(const Duration(milliseconds: 100), () {
//       FocusScope.of(context).requestFocus(emailFocusNode);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 70),
//                     Image.asset(
//                       "assets/images/logo.png",
//                       width: 230,
//                     ),
//                     const SizedBox(height: 40),
//                     const Text(
//                       'Register',
//                       style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 40),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.blue, width: 2),
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextField(
//                               controller: emailController,
//                               focusNode: emailFocusNode, // Attach focus node
//                               keyboardType: isNumericKeyboard ? TextInputType.number : TextInputType.emailAddress,
//                               decoration: InputDecoration(
//                                 labelText: isNumericKeyboard ? 'Number' : 'Email', // Dynamic label
//                                 prefixIcon: Icon(
//                                   isNumericKeyboard ? Icons.phone : Icons.email_outlined, // Dynamic icon
//                                   color: Colors.blue,
//                                 ),
//                                 border: const UnderlineInputBorder(
//                                   borderSide: BorderSide.none,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 60,
//                             decoration: const BoxDecoration(
//                               color: Colors.blue,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(20),
//                                 bottomLeft: Radius.circular(20),
//                                 topRight: Radius.circular(6),
//                                 bottomRight: Radius.circular(6),
//                               ),
//                             ),
//                             child: IconButton(
//                               onPressed: toggleKeyboardType,
//                               icon: Icon(
//                                 isNumericKeyboard ? Icons.keyboard : Icons.dialpad,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.blue, width: 2),
//                       ),
//                       child: TextField(
//                         controller: passwordController,
//                         obscureText: !isPasswordVisible,
//                         obscuringCharacter: '*',
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           prefixIcon: const Icon(
//                             Icons.lock_outline,
//                             color: Colors.blue,
//                           ),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               isPasswordVisible ? Icons.visibility_off : Icons.visibility,
//                               color: Colors.blue,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 isPasswordVisible = !isPasswordVisible;
//                               });
//                             },
//                           ),
//                           border: const UnderlineInputBorder(
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.blue, width: 2),
//                       ),
//                       child: TextField(
//                         controller: confirmPasswordController,
//                         obscureText: !isPasswordVisible,
//                         obscuringCharacter: '*',
//                         decoration: InputDecoration(
//                           labelText: 'Confirm Password',
//                           prefixIcon: const Icon(
//                             Icons.lock_outline,
//                             color: Colors.blue,
//                           ),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               isPasswordVisible ? Icons.visibility_off : Icons.visibility,
//                               color: Colors.blue,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 isPasswordVisible = !isPasswordVisible;
//                               });
//                             },
//                           ),
//                           border: const UnderlineInputBorder(
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         gradient: const LinearGradient(
//                           colors: [
//                             Color.fromARGB(255, 132, 195, 246),
//                             Color.fromARGB(255, 1, 89, 242)
//                           ],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                       ),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Navigator.of(context).pushNamed('/otpScreen');
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalInfoScreen()));
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.transparent,
//                           shadowColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: const Text(
//                           "Verify OTP",
//                           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 50),
//                     RichText(
//                       text: TextSpan(
//                         style: const TextStyle(fontSize: 18, color: Colors.black),
//                         children: [
//                           const TextSpan(text: 'Already have an account? '),
//                           WidgetSpan(
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text(
//                                 'Login',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.blue,
//                                   decoration: TextDecoration.underline,
//                                   fontSize: 17,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplier_dashboard/screens/supplier/providers/auth_provider.dart';
import 'package:supplier_dashboard/screens/supplier/views/auth/login_screen.dart';
import 'package:supplier_dashboard/screens/supplier/views/profile/personal_info.dart';
import '../../api/auth_api.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isLoading = false;

  void registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    final response = await AuthApi.register(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
print(response);
    setState(() {
      isLoading = false;
    });

    if (response["message"] == "Supplier registered successfully.") {
      String userId = response["supplier"]["id"];
      String userEmail = response["supplier"]["email"];
      String token = response["token"];

      // Save data in Provider & SharedPreferences
     Provider.of<AuthProvider>(context, listen: false).login(userId, userEmail, token);

      print("$userId , $userEmail , $token");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration Successful!"), backgroundColor: Colors.green),
         
      );

      // Navigate to Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PersonalInfoScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response["message"]), backgroundColor: Colors.red),
      );
    }

    // if (response["success"] == true) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("Registration Successful!"), backgroundColor: Colors.green),
    //   );
    //   // Navigate to login or home screen
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text(response["message"]), backgroundColor: const Color.fromARGB(255, 22, 201, 93)),
        
    //   );
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalInfoScreen()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/fflogo.png", width: 200),
                  const SizedBox(height: 20),
                  Text("Create an Account",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
                  const SizedBox(height: 20),
                  
                  // Email Input Field
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email, color: Colors.blue),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Email is required";
                      if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),

                  // Password Input Field
                  TextFormField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.blue),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Password is required";
                      if (value.length < 6) return "Password must be at least 6 characters";
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : registerUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text("Register", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Already have an account? Login
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // Navigate to login screen
                    },
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyle(color: Colors.blue, fontSize: 16, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
