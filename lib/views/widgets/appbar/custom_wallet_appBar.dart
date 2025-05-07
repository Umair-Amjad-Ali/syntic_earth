// ignore: file_names
import 'package:flutter/material.dart';

class CustomWalletAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomWalletAppBar({
    super.key,
    required this.title,
    required this.iconData,
  });

  final String title;
  final Icon iconData;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        top: topPadding + 10,
        left: width * 0.04,
        right: width * 0.04,
        bottom: 12,
      ),
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(width * 0.02),
                decoration: BoxDecoration(
                  color: Color(0xFF1D1D1D),
                  shape: BoxShape.circle,
                ),
                child: iconData,
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
