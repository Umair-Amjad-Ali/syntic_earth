import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/views/widgets/dummy_messages.dart';

class ChatController extends GetxController {
  var messages = <Map<String, String>>[].obs;
  var selectedChats = <int>{}.obs;
  final TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      messages.addAll(dummyMessages.map((msg) {
        return {
          "sender": msg["sender"]!,
          "text": msg["text"]!,
          "time": _currentTime(Get.context!),
        };
      }).toList());
    });
  }

  void sendMessage(String text, String sender) {
    if (text.trim().isNotEmpty) {
      messages.add(
          {"sender": sender, "text": text, "time": _currentTime(Get.context!)});
    }
  }

  String _currentTime(BuildContext context) {
    return TimeOfDay.now().format(context);
  }

  void toggleChatSelection(int index) {
    if (selectedChats.contains(index)) {
      selectedChats.remove(index);
    } else {
      selectedChats.add(index);
    }
  }

  void clearSelection() {
    selectedChats.clear();
  }

  bool isSelected(int index) {
    return selectedChats.contains(index);
  }
}
