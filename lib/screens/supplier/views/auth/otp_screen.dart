import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "OTP Verification",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 100, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "  Enter the 4-digit code sent\nto your Phone Number/Email",
                style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 45),

              /// OTP Input Field
              Pinput(
                controller: _otpController,
                length: 4,
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onCompleted: (pin) {
                  log("Entered OTP: $pin");
                },
              ),
              const SizedBox(height: 60),

              /// Submit Button
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
                    Navigator.of(context).pushNamedAndRemoveUntil('/loginScreen', (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Verify OTP",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ),

              const SizedBox(height: 60),
              Text("Did't receive any Code?", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),

              /// Resend Code Button
              TextButton(
                onPressed: () {
                  log("Resend OTP");
                },
                child: const Text(
                  "Resend Code",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    const TextSpan(text: 'Already have an account? '),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil('/loginScreen', (route) => false);
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
    );
  }
}
