import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/textfield_controller.dart';
import 'package:syntic_earth/views/screens/bottomsheet_profile_screen.dart';
import 'package:syntic_earth/views/screens/dropdown_screen.dart';
import 'package:syntic_earth/views/screens/filtered_data_screen.dart';
import 'package:syntic_earth/views/screens/marketplace_screen.dart';
import 'package:syntic_earth/views/screens/profile_screen.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_filter_screen_appbar.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_filter_screen_bottombar.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  final TextfieldController textfieldController = Get.put(
    TextfieldController(),
  );

  final List _screens = [
    FilteredDataScreen(),
    DropdownScreen(),
    BottomsheetProfileScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomFilterScreenAppbar(),
      body: Obx(() => _screens[textfieldController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => CustomFilterScreenBottombar(
          selectedIndex: textfieldController.selectedIndex.value,
          onTap: (index) {
            textfieldController.selectedIndex.value = index;
          },
        ),
      ),
    );
  }
}
