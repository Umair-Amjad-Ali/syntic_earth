import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: WalletManagement(),
    );
  }
}

class WalletManagement extends StatefulWidget {
  const WalletManagement({super.key});

  @override
  State<WalletManagement> createState() => _WalletManagementState();
}

class _WalletManagementState extends State<WalletManagement> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
