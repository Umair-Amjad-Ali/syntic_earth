import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/checkbox_controller.dart';
import 'package:syntic_earth/views/screens/authentication/login_screen.dart';
import 'package:syntic_earth/views/screens/authentication/otp_screen.dart';
import 'package:syntic_earth/views/widgets/button.dart';
import 'package:syntic_earth/views/widgets/textfield.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    final CheckboxController checkboxController = Get.put(CheckboxController());
    return Scaffold(
      backgroundColor: Color(0xff1A1A2E),
      body: SizedBox(
        height: mediaQuery.height,
        width: mediaQuery.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: mediaQuery.height * 0.1),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mediaQuery.height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Enter your email below to continue",
                    style: TextStyle(color: Color(0xffb8c2ff)),
                  ),
                ),

                SizedBox(height: mediaQuery.height * 0.02),
                Inputfield(
                  hinttext: "Email Address",
                  controller: emailController,
                  isEmail: true,
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: checkboxController.isChecked.value,
                        onChanged: checkboxController.toggleCheckBox,
                        activeColor: Color(0xff0AF9E6),

                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                      ),
                    ),
                    SizedBox(width: mediaQuery.width * 0.02),

                    SizedBox(
                      width: mediaQuery.width * 0.8,
                      child: Text.rich(
                        TextSpan(
                          text: "By checking you aggree to ",
                          style: TextStyle(
                            fontSize: mediaQuery.width * 0.038,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: "Terms and Conditions",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff0AF9E6),
                                decorationColor: Color(0xff0AF9E6),
                                decorationThickness: 1,
                                fontSize: mediaQuery.width * 0.04,
                              ),
                            ),
                            TextSpan(
                              text: " of the service provider ",
                              style: TextStyle(
                                fontSize: mediaQuery.width * 0.038,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                Obx(
                  () => Buttonwidget(
                    text: "Continue",
                    color: Color(0xff0AF9E6),
                    enabled: checkboxController.isChecked.value,
                    ontapped: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Otpscreen()),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                Text(
                  "Or",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: mediaQuery.height * 0.025,
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(color: Color(0xff0AF9E6)),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
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
