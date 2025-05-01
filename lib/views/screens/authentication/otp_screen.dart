import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/otp_controller.dart';
import 'package:syntic_earth/views/screens/authentication/password_screen.dart';
import 'package:syntic_earth/views/screens/onboarding/welcome_screen.dart';
import 'package:syntic_earth/views/widgets/button.dart';

class Otpscreen extends StatelessWidget {
  Otpscreen({super.key});

  final OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1A1A2E),

      body: SafeArea(
        child: SizedBox(
          height: mediaQuery.height,
          width: mediaQuery.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: mediaQuery.height * 0.1),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Check your inbox",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mediaQuery.height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.01),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "To continue enter the code we sent to your gmail",
                    style: TextStyle(color: Color(0xffb8c2ff)),
                  ),
                ),

                SizedBox(height: mediaQuery.height * 0.03),
                Obx(
                  () => SizedBox(
                    width: mediaQuery.width,
                    child: FittedBox(
                      child: OtpTextField(
                        numberOfFields: 4,

                        focusedBorderColor: const Color(0xff0AF9E6),
                        borderColor:
                            otpController.isError.value
                                ? Colors.red
                                : const Color(0xff0AF9E6),
                        fieldWidth: 50,
                        showFieldAsBox: true,
                        borderRadius: BorderRadius.circular(15),
                        textStyle: const TextStyle(color: Color(0xffb8c2ff)),
                        cursorColor: const Color(0xffb8c2ff),
                        onCodeChanged: (String code) {
                          otpController.updateOtp(code);
                        },
                        onSubmit: (String verificationCode) {
                          otpController.updateOtp(verificationCode);
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(height: mediaQuery.height * 0.03),

                Buttonwidget(
                  text: "Continue",
                  color: const Color(0xff0AF9E6),
                  ontapped: () {
                    if (otpController.validateOtp()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswordScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("All fields are required"),
                          backgroundColor: Color(0xff0AF9E6),
                        ),
                      );
                    }
                  },
                ),

                SizedBox(height: mediaQuery.height * 0.03),
                Text.rich(
                  TextSpan(
                    text: "Didn't received a code? ",
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "Resend",
                        style: TextStyle(color: Color(0xff0AF9E6)),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WelcomeScreen(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
