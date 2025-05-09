import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';

class ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: AppColors.bgColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage("assets/images/user2.webp"),
          ),
          SizedBox(width: screenWidth * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mentisa",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.circle, color: AppColors.primaryColor, size: 10),
                  SizedBox(width: 4),
                  Text(
                    "Online",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
