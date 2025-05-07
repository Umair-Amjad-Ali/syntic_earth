import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onTap;

  const BuildButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.28;
    final double height = MediaQuery.of(context).size.height * 0.06;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
