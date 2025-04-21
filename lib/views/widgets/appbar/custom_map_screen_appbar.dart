import 'package:flutter/material.dart';

class CustomMapScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onDrawerTap;
  final VoidCallback? onNotificationTap;

  const CustomMapScreenAppbar({
    super.key,
    required this.title,
    this.onDrawerTap,
    this.onNotificationTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151624),
      body: Container(
        // color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: SafeArea(
          bottom: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Drawer Icon
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: onDrawerTap ?? () {},
              ),

              // Title
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Notification Icon
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: onNotificationTap ?? () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
