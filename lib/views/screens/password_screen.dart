import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/textfield_controller.dart';
import 'package:syntic_earth/views/screens/welcome_screen.dart';
import 'package:syntic_earth/views/widgets/button.dart';
import 'package:syntic_earth/views/widgets/textfield.dart';

class PasswordScreen extends StatelessWidget {
  PasswordScreen({super.key});

  final TextfieldController textfieldController = Get.put(
    TextfieldController(),
  );
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    // final TextEditingController confirmPasswordController =
    //     TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xff1A1A2E),
      body: SizedBox(
        height: mediaQuery.height,
        width: mediaQuery.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: mediaQuery.height * 0.1),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password Setup",
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
                      "Please set your password",

                      style: TextStyle(color: Color(0xffb8c2ff)),
                    ),
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
                      // onChanged: (val) {
                      //   textfieldController.checkPasswordsMatch(
                      //     val,
                      //     confirmPasswordController.text,
                      //   );
                      // },
                    ),
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  Obx(
                    () => Inputfield(
                      hinttext: "Confirm Password",
                      controller: confirmPasswordController,
                      isPassword: true,
                      obsecuretext:
                          !textfieldController
                              .isConfirmPasswordVisibility
                              .value,
                      toggleVisibility:
                          textfieldController.toggleConfirmPasswordVisibility,
                      sufficoncolor: Color(0xffb8c2ff),
                      // onChanged: (val) {
                      //   textfieldController.checkPasswordsMatch(
                      //     confirmPasswordController.text,
                      //     val,
                      //   );
                      // },
                    ),
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),

                  SizedBox(height: mediaQuery.height * 0.02),

                  Buttonwidget(
                    text: "Continue",
                    color: Color(0xff0AF9E6),
                    // enabled: textfieldController.doPasswordsMatch.value,
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
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
