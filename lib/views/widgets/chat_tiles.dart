import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/chat_controller.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/screens/chat_screen.dart';
import 'package:syntic_earth/views/widgets/chat_items.dart';

class ChatTile extends StatelessWidget {
  final ChatItem chat;
  final double screenWidth;
  final int index;

  const ChatTile({
    super.key,
    required this.chat,
    required this.screenWidth,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find<ChatController>();

    double avatarSize = screenWidth * 0.12;
    double fontSize = screenWidth * 0.04;
    double messageFontSize = screenWidth * 0.035;
    double padding = screenWidth * 0.03;

    return Obx(() {
      bool isSelected = chatController.isSelected(index);

      return GestureDetector(
        onLongPress: () {
          chatController.toggleChatSelection(index);
        },
        onTap: () {
          if (chatController.selectedChats.isNotEmpty) {
            chatController.toggleChatSelection(index);
          } else {
            Get.to(() => ChatScreen());
          }
        },
        child: Container(
          color:
              isSelected
                  ? AppColors.textFieldColor.withOpacity(0.25)
                  : AppColors.bgColor,
          padding: EdgeInsets.symmetric(
            vertical: padding * 0.5,
            horizontal: padding,
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(chat.avatar),
                    radius: avatarSize * 0.5,
                  ),
                  if (isSelected)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: avatarSize * 0.2,
                        backgroundColor: AppColors.textFieldColor,
                        child: const Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 12,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: padding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            chat.name,
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (!chat.isTyping)
                          Icon(
                            _getMessageStatusIcon(chat.messageStatus),
                            color: _getMessageStatusColor(chat.messageStatus),
                            size: messageFontSize * 1.2,
                          ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            chat.message,
                            style: TextStyle(
                              fontSize: messageFontSize,
                              color:
                                  chat.isTyping
                                      ? AppColors.primaryColor
                                      : AppColors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    chat.time,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: messageFontSize * 0.9,
                    ),
                  ),
                  if (chat.unreadCount > 0)
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.015),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        chat.unreadCount.toString(),
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: messageFontSize,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  IconData _getMessageStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sent:
        return Icons.check;
      case MessageStatus.delivered:
      case MessageStatus.seen:
        return Icons.done_all;
    }
  }

  Color _getMessageStatusColor(MessageStatus status) {
    switch (status) {
      case MessageStatus.sent:
      case MessageStatus.delivered:
        return AppColors.grey;
      case MessageStatus.seen:
        return AppColors.primaryColor;
    }
  }
}
