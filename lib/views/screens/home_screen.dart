import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/textfield_controller.dart';
import 'package:syntic_earth/views/screens/marketplace_screen.dart';
import 'package:syntic_earth/views/screens/wallet/transfer_management.dart';
import 'package:syntic_earth/views/screens/wallet/wallet_management.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_map_screen_appbar.dart';
import 'package:syntic_earth/views/widgets/custom_bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextfieldController textfieldController = Get.put(
    TextfieldController(),
  );

  final List _screens = [
    MarketplaceScreen(),
    WalletManagement(),
    TransferScreen(),
    CustomMapScreenAppbar(title: "Syntic Earth"),
    MarketplaceScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _screens[textfieldController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => CustomBottomNavbar(
          selectedIndex: textfieldController.selectedIndex.value,
          onTap: (index) {
            textfieldController.selectedIndex.value = index;
          },
        ),
      ),
    );
  }
}
