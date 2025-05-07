import 'package:get/get.dart';
import 'package:syntic_earth/controllers/utils/models/notification_model.dart';
import 'package:syntic_earth/views/widgets/notification_data.dart';

class NotificationController extends GetxController {
  
  var notifications = NotificationData.notifications;
  void markAllAsRead() {
    for (var notification in notifications) {
      notification.isUnread.value = false;
    }
    notifications.refresh();
  }

  void deleteNotification(int index) {
    if (index >= 0 && index < notifications.length) {
      notifications.removeAt(index);
      notifications.refresh();
      Get.snackbar("Notification", "Deleted successfully");
    }
  }

  void clearAllNotifications() {
    notifications.clear();
    notifications.refresh();
    Get.snackbar("Notifications", "All notifications cleared");
  }

  var isMuted = false.obs;

  void toggleMuteNotifications() {
    isMuted.value = !isMuted.value;
  }

  void acceptNotification(NotificationModel notification) {
    print("Accepted: ${notification.title}");
  }

  void declineNotification(NotificationModel notification) {
    notifications.remove(notification);
    notifications.refresh();
    print("Declined: ${notification.title}");
  }
}
