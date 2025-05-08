import 'package:flutter/material.dart';

List<Map<String, String>> dummyMessages = [
  {
    "sender": "sender",
    "text": "Hey! How's your day going?",
  },
  {
    "sender": "sender",
    "text": "Sounds great! What project?",
  },
  {
    "sender": "sender",
    "text": "Sounds great! What project?",
  },
  {
    "sender": "user",
    "text": "Sounds great! What project?",
  },
  {
    "sender": "sender",
    "text": "Sounds great! What project?",
  },
  {
    "sender": "sender",
    "text": "A Flutter chat app UI with GetX!",
  },
];
void updateDummyMessagesWithTime(BuildContext context) {
  for (var message in dummyMessages) {
    message["time"] = TimeOfDay.now().format(context);
  }
}
