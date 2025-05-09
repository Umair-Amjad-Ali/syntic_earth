import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/widgets/button.dart';

class MuteNotification extends StatelessWidget {
  final RxString selectedMuteOption;
  final VoidCallback onMute;

  const MuteNotification({
    super.key,
    required this.selectedMuteOption,
    required this.onMute,
  });

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    final double width = MediaQuery.of(context).size.width * 0.75;
    final double height = MediaQuery.of(context).size.height * 0.4;

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
                "Mute Notifications",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.05),
              _buildRadioOption("24 hours"),
              _buildRadioOption("1 week"),
              _buildRadioOption("Always"),
              SizedBox(height: height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttonwidget(
                    btnwidth: mediaQuery.width * 0.3,
                    text: "Cancel",
                    borderColor: AppColors.primaryColor,
                    ontapped: () => Get.back(),
                  ),
                  // BuildButton(
                  //   text: "Cancel",
                  //   bgColor: Colors.grey[800]!,
                  //   textColor: AppColors.white,
                  //   onTap: () => Get.back(),
                  // ),
                  Buttonwidget(
                    btnwidth: mediaQuery.width * 0.3,
                    text: "Mute",
                    color: AppColors.primaryColor,
                    ontapped: () {
                      onMute();
                      Get.back();
                    },
                  ),
                  // BuildButton(
                  //   text: "Mute",
                  //   bgColor: AppColors.textFieldColor,
                  //   textColor: AppColors.white,
                  //   onTap: () {
                  //     onMute();
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

  Widget _buildRadioOption(String label) {
    return Obx(
      () => RadioListTile<String>(
        value: label,
        groupValue: selectedMuteOption.value,
        onChanged: (value) {
          selectedMuteOption.value = value!;
        },
        title: Text(label, style: const TextStyle(color: AppColors.white)),
        activeColor: AppColors.primaryColor,
      ),
    );
  }
}
