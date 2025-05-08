import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/chat_controller.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/widgets/chat_messages.dart';

class ChatWidget extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());

  ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        return Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    var message = controller.messages[index];
                    bool isUser = message["sender"] == "user";

                    return ChatMessage(
                      message: message["text"]!,
                      time: message["time"]!,
                      isUser: isUser,
                      avatarUrl: "assets/images/logo.png",
                      screenWidth: screenWidth,
                    );
                  },
                ),
              ),
            ),
            _buildInputField(context, screenWidth),
          ],
        );
      },
    );
  }

  Widget _buildInputField(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller:
                  controller.messageController, // ✅ Use existing controller
              style: TextStyle(color: AppColors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.messageColor,
                hintText: "Type a message",
                hintStyle: TextStyle(color: AppColors.grey),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Icon(Icons.emoji_emotions_outlined,
                      color: Colors.grey, size: screenWidth * 0.07),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.camera_alt,
                          color: Colors.grey, size: screenWidth * 0.07),
                      SizedBox(width: screenWidth * 0.03),
                      Icon(Icons.mic,
                          color: Colors.grey, size: screenWidth * 0.07),
                      SizedBox(width: screenWidth * 0.03),
                    ],
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          GestureDetector(
            onTap: () {
              if (controller.messageController.text.trim().isNotEmpty) {
                controller.sendMessage(
                    controller.messageController.text, "user");
                controller.messageController.clear();
              }
            },
            child: CircleAvatar(
              radius: screenWidth * 0.06,
              backgroundColor: AppColors.primaryBlue,
              child: Icon(
                Icons.send,
                color: AppColors.white,
                size: screenWidth * 0.05,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
