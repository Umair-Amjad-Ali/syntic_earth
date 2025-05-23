import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/screens/notification_screen.dart';
import 'package:syntic_earth/views/screens/wallet/wallet_management.dart';
import 'package:syntic_earth/views/widgets/map_screen.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_map_screen_appbar.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomMapScreenAppbar(
        title: "Syntic Earth",
        onNotificationTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationScreen()),
          );
        },
      ),
      backgroundColor: AppColors.bgColor,

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              color: AppColors.textFieldColor,
              // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Side: Balance Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Balance",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14,
                          ),
                        ),
                        // SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WalletManagement(),
                              ),
                            );
                          },
                          child: Icon(Icons.more_horiz, color: AppColors.white),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$20,000",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "+12% Today",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Stack(
                children: [
                  Container(
                    height: mediaQuery.height * 0.5,
                    // width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: MapScreen(),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ), // Adjust the value for roundness
                      ),
                      onPressed: () {},
                      child: Icon(Icons.add, size: 40),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
