import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String time;
  final String avatarUrl;
  final bool isUser;
  final double screenWidth;

  const ChatMessage({
    super.key,
    required this.message,
    required this.time,
    required this.avatarUrl,
    required this.isUser,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.015),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            CircleAvatar(
              radius: screenWidth * 0.06,
              backgroundImage: AssetImage(avatarUrl),
            ),
          if (!isUser) SizedBox(width: screenWidth * 0.02),
          Column(
            crossAxisAlignment:
                isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenWidth * 0.025),
                decoration: BoxDecoration(
                  color:
                      isUser ? AppColors.primaryColor : AppColors.messageColor,
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                ),
                constraints: BoxConstraints(
                  maxWidth: screenWidth * 0.7,
                ),
                child: Text(
                  message,
                  style: TextStyle(
                      color: Colors.white, fontSize: screenWidth * 0.04),
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                time,
                style: TextStyle(
                    color: Colors.grey[500], fontSize: screenWidth * 0.03),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
