import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/notification_controller.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/widgets/button.dart';

class DeleteNotification extends StatelessWidget {
  final NotificationController controller;

  const DeleteNotification({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    final double width = MediaQuery.of(context).size.width * 0.75;
    final double height = MediaQuery.of(context).size.height * 0.2;

    return Dialog(
      backgroundColor: AppColors.textFieldColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Are you sure you want to delete all notifications?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttonwidget(
                    btnwidth: mediaQuery.width * 0.3,
                    text: "No",
                    borderColor: AppColors.primaryColor,
                    ontapped: () => Get.back(),
                  ),
                  // BuildButton(
                  //   text: "No",
                  //   bgColor: Colors.grey[800]!,
                  //   textColor: AppColors.white,
                  //   onTap: () => Get.back(),
                  // ),
                  Buttonwidget(
                    btnwidth: mediaQuery.width * 0.3,
                    text: "Yes",
                    color: AppColors.primaryColor,
                    ontapped: () {
                      controller.notifications.clear();
                      Get.back();
                    },
                  ),
                  // BuildButton(
                  //   text: "Yes",
                  //   bgColor: AppColors.typingColor,
                  //   textColor: Colors.white,
                  //   onTap: () {
                  //     controller.notifications.clear();
                  //     Get.back();
                  //   },
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
