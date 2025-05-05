import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/textfield_controller.dart';
import 'package:syntic_earth/views/screens/dropdown_screen.dart';
import 'package:syntic_earth/views/screens/google_map_screen.dart';
import 'package:syntic_earth/views/screens/marketplace_screen.dart';
import 'package:syntic_earth/views/screens/profile_screen.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_filter_screen_bottombar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextfieldController textfieldController = Get.put(
    TextfieldController(),
  );

  final List _screens = [
    MarketplaceScreen(),
    GoogleMapScreen(),
    DropdownScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
