import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/screens/authentication/login_screen.dart';
import 'package:syntic_earth/views/screens/authentication/signup_screen.dart';
import 'package:syntic_earth/views/widgets/button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: mediaQuery.height,
        width: mediaQuery.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              Text(
                "Welcome to SynticEarth",
                style: TextStyle(
                  fontSize: mediaQuery.height * 0.03,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.02),
              Text(
                "We're building a 1:1 scale playable digital Earth and thank you for being a part of this journey",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textColor),
              ),
              SizedBox(height: mediaQuery.height * 0.02),
              Buttonwidget(
                text: "Get Started",
                color: AppColors.primaryColor,
                ontapped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              SizedBox(height: mediaQuery.height * 0.02),
              Text.rich(
                TextSpan(
                  text: "Haven't registered yet? ",
                  style: TextStyle(color: AppColors.textColor),
                  children: [
                    TextSpan(
                      text: "Register",
                      style: TextStyle(color: AppColors.primaryColor),
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
    );
  }
}
