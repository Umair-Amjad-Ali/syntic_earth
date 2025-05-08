import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/chat_controller.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/widgets/appbar/chat_screen_appbar.dart';
import 'package:syntic_earth/views/widgets/chat_tiles.dart';
import 'package:syntic_earth/views/widgets/private_chat_data.dart';

class PrivateChatScreen extends StatelessWidget {
  const PrivateChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.put(ChatController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomChatAppBar(title: "Chat"),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            chatController.clearSelection();
          },
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                  vertical: screenHeight * 0.005,
                ),
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.02),
                      child: Icon(
                        Icons.search,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey[900],
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.02,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ChatTile(
                          chat: chats[index],
                          screenWidth: screenWidth,
                          index: index,
                        ),
                        SizedBox(height: screenHeight * 0.005),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
