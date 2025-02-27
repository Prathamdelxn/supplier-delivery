import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'NavigationPages.dart';
import 'screens/supplier/views/auth/forgot_otp_screen.dart';
import 'screens/supplier/views/auth/forgot_password.dart';
import 'screens/supplier/views/auth/login_screen.dart';
import 'screens/supplier/views/auth/new_password.dart';
import 'screens/supplier/views/auth/otp_screen.dart';
import 'screens/supplier/views/auth/register_screen.dart';
import 'screens/supplier/views/profile/personal_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MainApp(
    token: prefs.getString('token'),
  ));
}

class MainApp extends StatelessWidget {
  final token;
  const MainApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (token != null && JwtDecoder.isExpired(token!) == false) ? PersonalInfoScreen(token: token!) : LoginScreen(),
      routes: {
        '/navigationScreen': (context) => NavigationPage(),
        '/loginScreen': (context) => LoginScreen(),
        '/registerScreen': (context) => RegisterScreen(),
        '/otpScreen': (context) => OtpScreen(),
        '/forgotOtpScreen': (context) => ForgotOtpScreen(),
        '/forgotPasswordScreen': (context) => ForgotPasswordScreen(),
        '/newPasswordScreen': (context) => NewPasswordScreen(),
      },
    );
  }
}
