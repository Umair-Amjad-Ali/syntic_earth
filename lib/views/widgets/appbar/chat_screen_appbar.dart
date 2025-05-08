import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';

class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomChatAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.06;
    double padding = screenWidth * 0.04;

    return AppBar(
      backgroundColor: AppColors.bgColor,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.08),
        child: GestureDetector(
          onTap: () {
            // Get.toNamed(AppRoutes.profileScreen2);
          },
          child: CircleAvatar(
            radius: screenWidth * 0.03,
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.05,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white, size: iconSize),
          onPressed: () {
            // Get.toNamed(AppRoutes.notificationScreen);
          },
        ),
        PopupMenuButton<String>(
          icon: Icon(Icons.menu, color: Colors.white, size: iconSize),
          color: Colors.grey[900],
          offset: const Offset(0, 50),
          onSelected: (value) {
            if (value == 'Plan') {
              // Get.toNamed(AppRoutes.subscriptionScreen);
            } else if (value == 'Profile') {
              // Get.toNamed(AppRoutes.profileScreen2);
            } else if (value == 'Leaderboard') {
              // Get.toNamed(AppRoutes.laderboardScreen);
            }
          },
          itemBuilder:
              (BuildContext context) => [
                _buildMenuItem('Plan'),
                _buildMenuItem('Profile'),
                _buildMenuItem('Leaderboard'),
              ],
        ),
        SizedBox(width: padding),
      ],
    );
  }

  PopupMenuItem<String> _buildMenuItem(String text) {
    return PopupMenuItem<String>(
      value: text,
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
