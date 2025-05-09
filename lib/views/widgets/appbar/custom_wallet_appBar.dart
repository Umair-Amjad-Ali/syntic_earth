// ignore: file_names
import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';

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
      color: AppColors.bgColor,
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
                  color: AppColors.secondaryColor,
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
                color: AppColors.white,
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
