import 'package:flutter/material.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_wallet_appbar.dart';
import 'package:syntic_earth/views/widgets/button.dart';
import 'package:syntic_earth/views/widgets/custom_filtered_data_card.dart';
import 'package:syntic_earth/views/widgets/map_screen.dart';

class ViewLandDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> userData;
  const ViewLandDetailsScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    final isSmallScreen = mediaQuery.width < 360;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomWalletAppBar(
                title: "View Land",
                iconData: Icon(Icons.arrow_back_ios_new, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: mediaQuery.height * 0.3,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: MapScreen(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  mediaQuery.width * 0.04,
                ), // responsive padding
                child: Row(
                  children: [
                    // EPL Text
                    Text(
                      "EPL",
                      style: TextStyle(
                        color: const Color(0xFF28E1C7),
                        fontWeight: FontWeight.bold,
                        fontSize: isSmallScreen ? 14 : 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // ID with border
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: mediaQuery.width * 0.01,
                          horizontal: mediaQuery.width * 0.02,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF253049)),
                        ),
                        child: Text(
                          "ea225a29-a11d-45fb-af4f-7170dfb9fc21",
                          style: const TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Copy Icon
                    Icon(
                      Icons.copy_all_outlined,
                      color: const Color(0xFF28E1C7),
                      size: isSmallScreen ? 18 : 22,
                    ),
                    const SizedBox(width: 8),
                    // Share Icon
                    Icon(
                      Icons.share,
                      color: const Color(0xFF28E1C7),
                      size: isSmallScreen ? 18 : 22,
                    ),
                  ],
                ),
              ),
              CustomFilteredDataCard(
                value: userData["value"],
                countryName: userData["countryName"],
                countryFlag: userData["countryFlag"],
                tileClass: userData["tileClass"],
                landTier: userData["landTier"],
                tiles: userData["tiles"],
                essence: userData["essence"],
                valuePercent: userData["valuePercent"],
                claims: userData["claims"],
                ontap: () {},
                showButtons: false,
                ontapbuy: () {},
              ),
              Container(
                alignment: Alignment.topLeft,
                width: mediaQuery.width,
                decoration: BoxDecoration(color: Color(0xFF1B1C2B)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Property Deed",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "b87abca-f6a5-445f-b482-792dd40e986",
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                      Text(
                        "Owned By",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF253049),
                              ),
                            ),
                            SizedBox(width: mediaQuery.width * 0.03),

                            Text(
                              userData["countryName"],
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: mediaQuery.height * 0.01),

                      Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Discounts and sales on everything visit profile",
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                      Text(
                        "Location",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sham Shui Po District, Hong Kong",
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(height: mediaQuery.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mentar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Active",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Land Class",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "3",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tier",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "T1",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tiles",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "45",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: mediaQuery.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Min. Essence",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: mediaQuery.height * 0.005),
                                Text(
                                  "193.2849",
                                  style: TextStyle(color: Colors.cyanAccent),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Essence Transformed",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: mediaQuery.height * 0.005),
                                Text(
                                  "127.64",
                                  style: TextStyle(color: Colors.cyanAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: mediaQuery.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Purchased For",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: mediaQuery.height * 0.005),
                                Text(
                                  "ES27.50",
                                  style: TextStyle(color: Colors.cyanAccent),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New Land Value (T1)",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: mediaQuery.height * 0.005),
                                Text(
                                  "ES401.50",
                                  style: TextStyle(color: Colors.cyanAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: mediaQuery.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New Land Value (T1)",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: mediaQuery.height * 0.005),
                                Text(
                                  "ES36.50",
                                  style: TextStyle(color: Colors.cyanAccent),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New Land Value (T1)",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: mediaQuery.height * 0.005),
                                Text(
                                  "ES39.50",
                                  style: TextStyle(color: Colors.cyanAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: mediaQuery.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF253049),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Buy Now For",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "ES0.05",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF253049),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "1360.15% \u2191",
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.cyanAccent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: mediaQuery.width * 0.05),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF253049),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Buy Now For",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "ES0.05",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF253049),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "-100.00% \u2193",
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Buttonwidget(
                        text: "View",
                        borderColor: Colors.cyanAccent,
                      ),
                    ),
                    SizedBox(width: mediaQuery.width * 0.04),
                    Expanded(
                      child: Buttonwidget(
                        text: "Buy",
                        color: Colors.cyanAccent,
                      ),
                    ),
                    SizedBox(width: mediaQuery.width * 0.04),
                    Expanded(
                      child: Buttonwidget(
                        text: "Bid",
                        borderColor: Colors.cyanAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
