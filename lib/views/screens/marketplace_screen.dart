import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/textfield_controller.dart';
// import 'package:syntic_earth/views/screens/wallet/transfer_management.dart';
// import 'package:syntic_earth/views/screens/wallet/wallet_management.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_wallet_appBar.dart';
// import 'package:syntic_earth/views/widgets/custom_bottom_navbar.dart';
import 'package:syntic_earth/views/widgets/marketplace_card.dart';

class MarketplaceScreen extends StatelessWidget {
  MarketplaceScreen({super.key});
  final TextfieldController textfieldController = Get.put(
    TextfieldController(),
  );

  //   final List<Widget> _screens = [
  //   MarketplaceScreen(),
  //   WalletManagement(),
  //   TransferScreen(),
  //   WalletManagement(),
  //   MarketplaceScreen(),
  // ];

  final List<Map<String, dynamic>> marketplaceData = [
    {
      "location": "Tokyo, Japan",
      "tiles": "25 Tiles (5x5 Cluster)",
      "listedBy": "Listed by MetaTycoon",
      "price": "\$1,890",
      "tags": ["Tourist Hotspot", "Limited"],
      "icon": Icons.location_city,
    },
    {
      "location": "New York, USA",
      "tiles": "10 Tiles (2x5 Cluster)",
      "listedBy": "Listed by CityHunter",
      "price": "\$999",
      "tags": ["Business", "Skyscraper"],
      "icon": Icons.apartment,
    },
    {
      "location": "Paris, France",
      "tiles": "16 Tiles (4x4 Cluster)",
      "listedBy": "Listed by EiffelHoldings",
      "price": "\$1,500",
      "tags": ["Romantic", "Cultural"],
      "icon": Icons.landscape,
    },
    {
      "location": "Dubai, UAE",
      "tiles": "20 Tiles (4x5 Cluster)",
      "listedBy": "Listed by DesertKings",
      "price": "\$2,200",
      "tags": ["Luxury", "Skyline"],
      "icon": Icons.location_city_outlined,
    },
    {
      "location": "London, UK",
      "tiles": "12 Tiles (3x4 Cluster)",
      "listedBy": "Listed by RoyalAssets",
      "price": "\$1,250",
      "tags": ["Historic", "Financial Hub"],
      "icon": Icons.castle,
    },
    {
      "location": "Berlin, Germany",
      "tiles": "15 Tiles (3x5 Cluster)",
      "listedBy": "Listed by UrbanCore",
      "price": "\$1,100",
      "tags": ["Urban", "Modern"],
      "icon": Icons.domain,
    },
    {
      "location": "Singapore",
      "tiles": "18 Tiles (3x6 Cluster)",
      "listedBy": "Listed by IslandTech",
      "price": "\$1,750",
      "tags": ["Smart City", "Clean"],
      "icon": Icons.device_hub,
    },
    {
      "location": "Sydney, Australia",
      "tiles": "22 Tiles (4x5 Cluster)",
      "listedBy": "Listed by HarborEstate",
      "price": "\$1,620",
      "tags": ["Seaside", "Popular"],
      "icon": Icons.beach_access,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          CustomWalletAppBar(
            title: "MarketPlace",
            iconData: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          SizedBox(height: height * 0.015),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              child: ListView.builder(
                itemCount: marketplaceData.length,
                itemBuilder: (context, index) {
                  final data = marketplaceData[index];
                  return MarketplaceCard(
                    location: data["location"],
                    tiles: data["tiles"],
                    listedBy: data["listedBy"],
                    price: data["price"],
                    tags: data["tags"],
                    icon: data["icon"],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Obx(
      //   () => CustomBottomNavbar(
      //     selectedIndex: textfieldController.selectedIndex.value,
      //     onTap: (index) {
      //       textfieldController.selectedIndex.value = index;
      //     },
      //   ),
      // ),
    );
  }
}
