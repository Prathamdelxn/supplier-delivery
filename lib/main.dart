// import 'package:flutter/material.dart';

// import 'NavigationPages.dart';
// import 'screens/supplier/views/auth/forgot_otp_screen.dart';
// import 'screens/supplier/views/auth/forgot_password.dart';
// import 'screens/supplier/views/auth/login_screen.dart';
// import 'screens/supplier/views/auth/new_password.dart';
// import 'screens/supplier/views/auth/otp_screen.dart';
// import 'screens/supplier/views/auth/register_screen.dart';
// import 'screens/supplier/views/home/home_screen.dart';
// import 'screens/supplier/views/profile/personal_info.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/loginScreen',
//       // initialRoute: '/profileInfoScreen',
//       routes: {
//         '/homeScreen': (context) => NavigationPage(),
//         '/profileInfoScreen': (context) => PersonalInfoScreen(),
//         '/loginScreen': (context) => LoginScreen(),
//         '/registerScreen': (context) => RegisterScreen(),
//         '/otpScreen': (context) => OtpScreen(),
//         '/forgotOtpScreen': (context) => ForgotOtpScreen(),
//         '/forgotPasswordScreen': (context) => ForgotPasswordScreen(),
//         '/newPasswordScreen': (context) => NewPasswordScreen(),
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supplier_dashboard/screens/supplier/providers/auth_provider.dart';


import 'NavigationPages.dart';
import 'screens/supplier/views/auth/forgot_otp_screen.dart';
import 'screens/supplier/views/auth/forgot_password.dart';
import 'screens/supplier/views/auth/login_screen.dart';
import 'screens/supplier/views/auth/new_password.dart';
import 'screens/supplier/views/auth/otp_screen.dart';
import 'screens/supplier/views/auth/register_screen.dart';
import 'screens/supplier/views/home/home_screen.dart';
import 'screens/supplier/views/profile/personal_info.dart';

Future<void> main() async {
   await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
   bool isLoggedIn = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkLoginStatus(); 
  }
  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    setState(() {
      isLoggedIn = token != null;
      isLoading = false;
    });
     print(isLoggedIn);
    
  }
 

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: isLoading 
    ? Scaffold(body: Center(child: CircularProgressIndicator()))
    : (isLoggedIn ? NavigationPage() : LoginScreen()),
      // initialRoute: isLoggedIn ? '/homeScreen' : '/loginScreen',
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
