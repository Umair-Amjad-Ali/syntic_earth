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
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final topPadding = mediaQuery.padding.top;

    final double fontSize = width.clamp(320.0, 600.0) * 0.045;
    final double iconContainerSize = width * 0.1; 

    return Container(
      padding: EdgeInsets.only(
        top: topPadding + 10,
        left: width * 0.04,
        right: width * 0.04,
        bottom: 12,
      ),
      color: AppColors.bgColor,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: iconContainerSize,
              height: iconContainerSize,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  iconData.icon,
                  color: iconData.color,
                  size: fontSize,
                ),
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: iconContainerSize, height: iconContainerSize),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
