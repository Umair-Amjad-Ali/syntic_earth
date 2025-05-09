import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/notification_controller.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/controllers/utils/models/notification_model.dart';
import 'package:syntic_earth/views/widgets/button.dart';
import 'package:syntic_earth/views/widgets/delete_notification.dart';
import 'package:syntic_earth/views/widgets/mute_notification.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationController controller = Get.put(NotificationController());
  final RxString selectedMuteOption = "24 hours".obs;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontSize = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: _buildAppBar(screenWidth, screenHeight, fontSize),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Obx(() {
          if (controller.notifications.isEmpty) {
            return Center(
              child: Text(
                "No notifications",
                style: TextStyle(color: AppColors.grey, fontSize: fontSize),
              ),
            );
          }

          final recentNotifications = controller.notifications
              .where((n) => n.type != "Request Denied")
              .toList(growable: false);
          final requestDeniedNotifications = controller.notifications
              .where((n) => n.type == "Request Denied")
              .toList(growable: false);

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              if (recentNotifications.isNotEmpty) ...[
                _buildSectionTitle("Recents", fontSize, context),
                ...recentNotifications.map(
                  (n) => _buildNotificationTile(n, fontSize, context),
                ),
              ],
              if (requestDeniedNotifications.isNotEmpty) ...[
                _buildSectionTitle("20th Feb", fontSize, context),
                ...requestDeniedNotifications.map(
                  (n) => _buildNotificationTile(n, fontSize, context),
                ),
              ],
            ],
          );
        }),
      ),
    );
  }

  AppBar _buildAppBar(
    double screenWidth,
    double screenHeight,
    double fontSize,
  ) {
    return AppBar(
      backgroundColor: AppColors.bgColor,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColors.white,
        ),
      ),
      title: Text(
        "Notifications",
        style: TextStyle(
          color: AppColors.white,
          fontSize: fontSize * 1.2,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        PopupMenuButton<String>(
          color: AppColors.secondaryColor,
          icon: const Icon(Icons.settings, color: AppColors.white),
          offset: Offset(0, screenHeight * 0.06),
          onSelected: (value) {
            if (value == "mute") {
              _showMuteNotificationDialog();
            } else if (value == "delete") {
              _showDeleteAllDialog();
            }
          },
          itemBuilder:
              (context) => [
                _buildPopupMenuItem(
                  "mute",
                  Icons.volume_off,
                  "Mute Notifications",
                  fontSize,
                ),
                _buildPopupMenuItem(
                  "delete",
                  Icons.delete,
                  "Delete Notifications",
                  fontSize,
                ),
              ],
        ),
        SizedBox(width: screenWidth * 0.02),
      ],
    );
  }

  Widget _buildNotificationTile(
    NotificationModel notification,
    double fontSize,
    BuildContext context,
  ) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: screenWidth * 0.06,
              backgroundColor: AppColors.grey,
              backgroundImage:
                  (notification.avatar.isNotEmpty)
                      ? AssetImage(notification.avatar)
                      : null,
              child:
                  (notification.avatar.isEmpty)
                      ? const Icon(Icons.notifications, color: AppColors.white)
                      : null,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    notification.title,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  notification.time ?? '',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: fontSize * 0.85,
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        notification.message,
                        style: TextStyle(
                          color:
                              notification.isUnread.value
                                  ? AppColors.white
                                  : AppColors.grey,
                          fontSize: fontSize * 0.9,
                        ),
                      ),
                    ),
                    if (notification.isUnread.value)
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.02),
                        child: Container(
                          width: screenWidth * 0.018,
                          height: screenWidth * 0.018,
                          decoration: BoxDecoration(
                            color: AppColors.textFieldColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (notification.type == "Live Invite") ...[
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: screenHeight * 0.06,
                    child: Buttonwidget(
                      borderColor: AppColors.primaryColor,
                      text: "Decline",
                      ontapped:
                          () => controller.declineNotification(notification),
                    ),
                    // OutlinedButton(
                    //   onPressed:
                    //       () => controller.declineNotification(notification),
                    //   style: OutlinedButton.styleFrom(
                    //     side: BorderSide(color: AppColors.textFieldColor),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(
                    //         screenWidth * 0.03,
                    //       ),
                    //     ),
                    //   ),
                    //   child: Text(
                    //     "Decline",
                    //     style: TextStyle(
                    //       color: AppColors.textFieldColor,
                    //       fontSize: fontSize * 0.9,
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: SizedBox(
                    height: screenHeight * 0.06,
                    child: Buttonwidget(
                      color: AppColors.primaryColor,
                      text: "Accept",
                      ontapped:
                          () => controller.acceptNotification(notification),
                    ),
                    // ElevatedButton(
                    //   onPressed:
                    //       () => controller.acceptNotification(notification),
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: AppColors.textFieldColor,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(
                    //         screenWidth * 0.03,
                    //       ),
                    //     ),
                    //   ),
                    //   child: Text(
                    //     "Accept",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: fontSize * 0.9,
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
    String title,
    double fontSize,
    BuildContext context,
  ) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.white,
          fontSize: fontSize * 1.1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(
    String value,
    IconData icon,
    String text,
    double fontSize,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: AppColors.white, size: fontSize * 1.1),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(color: AppColors.white, fontSize: fontSize),
          ),
        ],
      ),
    );
  }

  void _showDeleteAllDialog() {
    Get.dialog(DeleteNotification(controller: controller));
  }

  void _showMuteNotificationDialog() {
    // print("mute notificatio printed.... check it out ..");
    Get.dialog(
      MuteNotification(
        selectedMuteOption: selectedMuteOption,
        onMute: () => controller.toggleMuteNotifications(),
      ),
    );
  }
}
