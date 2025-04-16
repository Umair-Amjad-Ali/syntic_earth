import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/textfield_controller.dart';
import 'package:syntic_earth/views/screens/authentication/signup_screen.dart';
import 'package:syntic_earth/views/screens/onboarding/welcome_screen.dart';
import 'package:syntic_earth/views/widgets/button.dart';
import 'package:syntic_earth/views/widgets/textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextfieldController textfieldController = Get.put(
    TextfieldController(),
  );
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1A1A2E),
      body: SizedBox(
        width: mediaQuery.width,
        height: mediaQuery.height,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: mediaQuery.height * 0.1),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Login",
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
                      "We're building a 1:1 scale playable digital Earth and thank you for being a part of this journey",

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
                  Obx(
                    () => Inputfield(
                      hinttext: "Password",
                      controller: passwordController,
                      isPassword: true,
                      obsecuretext:
                          !textfieldController.isPasswordVisible.value,
                      toggleVisibility:
                          textfieldController.togglePasswordVisibility,
                      sufficoncolor: Color(0xffb8c2ff),
                      // isPasswordVisibility:
                      //     textfieldController.isPasswordVisible.value,
                    ),
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  Buttonwidget(
                    text: "Login",
                    color: Color(0xff0AF9E6),
                    ontapped: () {
                      if (_formKey.currentState!.validate()) {
                        // If form is valid, proceed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        );
                      }
                    },
                    // ontapped: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    //   );
                    // },
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  Text(
                    "Or",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mediaQuery.height * 0.03,
                    ),
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  Buttonwidget(
                    text: "Continue with Google",
                    borderColor: Color(0xff0AF9E6),
                    imageAssetPath: "assets/images/google.svg",
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  Buttonwidget(
                    text: "Continue with Apple",
                    borderColor: Color(0xff0AF9E6),
                    imageAssetPath: "assets/images/apple.svg",
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  Text.rich(
                    TextSpan(
                      text: "Haven't registered yet? ",
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "Register",
                          style: TextStyle(color: Color(0xff0AF9E6)),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupScreen(),
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
      ),
    );
  }
}
