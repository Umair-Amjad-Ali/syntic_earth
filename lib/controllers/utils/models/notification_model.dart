import 'package:get/get.dart';

class NotificationModel {
  String title;
  String message;
  String? time;
  String? date;
  String avatar;
  RxBool isUnread;
  String type;

  NotificationModel({
    required this.title,
    required this.message,
    this.time,
    this.date,
    required this.avatar,
    required this.isUnread,
    required this.type,
  });
}
