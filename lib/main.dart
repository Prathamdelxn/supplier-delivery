import 'package:flutter/material.dart';

import 'NavigationPages.dart';
import 'screens/supplier/views/auth/forgot_otp_screen.dart';
import 'screens/supplier/views/auth/forgot_password.dart';
import 'screens/supplier/views/auth/login_screen.dart';
import 'screens/supplier/views/auth/new_password.dart';
import 'screens/supplier/views/auth/otp_screen.dart';
import 'screens/supplier/views/auth/register_screen.dart';
import 'screens/supplier/views/home/home_screen.dart';
import 'screens/supplier/views/profile/personal_info.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/loginScreen',
      // initialRoute: '/profileInfoScreen',
      routes: {
        '/homeScreen': (context) => NavigationPage(),
        '/profileInfoScreen': (context) => PersonalInfoScreen(),
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
