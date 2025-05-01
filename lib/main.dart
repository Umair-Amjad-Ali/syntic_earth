import 'package:flutter/material.dart';
import 'package:syntic_earth/views/screens/onboarding/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(), // Change this to your desired screen
    );
  }
}
