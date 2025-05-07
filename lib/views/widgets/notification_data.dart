import 'package:get/get.dart';
import 'package:syntic_earth/controllers/utils/models/notification_model.dart';

class NotificationData {
  static final notifications =
      <NotificationModel>[
        NotificationModel(
          title: "Live Invite",
          message:
              "Sabrina invited you to attend the voice Live John conducted",
          time: "8:00 PM",
          avatar: "assets/images/logo.png",
          isUnread: true.obs,
          type: "Live Invite",
        ),
        NotificationModel(
          title: "Chat Invite",
          message: "Jasmine messaged you to chat",
          time: "8:00 PM",
          avatar: "assets/images/logo.png",
          isUnread: true.obs,
          type: "Chat Invite",
        ),
        NotificationModel(
          title: "Chat Invite",
          message: "Jasmine messaged you to chat",
          time: "8:00 PM",
          avatar: "assets/images/logo.png",
          isUnread: true.obs,
          type: "Chat Invite",
        ),
        NotificationModel(
          title: "Chat Invite",
          message: "Jasmine messaged you to chat",
          time: "8:00 PM",
          avatar: "assets/images/logo.png",
          isUnread: true.obs,
          type: "Chat Invite",
        ),
        NotificationModel(
          title: "Request Denied",
          message: "Your request to join has been denied.",
          date: "20th Feb",
          avatar: "assets/images/logo.png",
          isUnread: false.obs,
          type: "Request Denied",
        ),
        NotificationModel(
          title: "Request Denied",
          message: "Your request to join has been denied.",
          date: "21st Feb",
          avatar: "assets/images/logo.png",
          isUnread: false.obs,
          type: "Request Denied",
        ),
        NotificationModel(
          title: "Request Denied",
          message: "Your request to join has been denied.",
          date: "21st Feb",
          avatar: "assets/images/logo.png",
          isUnread: false.obs,
          type: "Request Denied",
        ),
        NotificationModel(
          title: "Request Denied",
          message: "Your request to join has been denied.",
          date: "21st Feb",
          avatar: "assets/images/logo.png",
          isUnread: false.obs,
          type: "Request Denied",
        ),
      ].obs;
}
