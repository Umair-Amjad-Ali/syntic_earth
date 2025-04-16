import 'package:flutter/material.dart';

class WalletActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const WalletActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.015),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyanAccent,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: width * 0.035),
          ),
          child: Text(label, style: TextStyle(fontSize: width * 0.04)),
        ),
      ),
    );
  }
}
