import 'package:flutter/material.dart';
import 'package:syntic_earth/views/screens/bottomsheet_profile_screen.dart';
import 'package:syntic_earth/views/screens/view_land_details_screen.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_filter_screen_appbar.dart';
import 'package:syntic_earth/views/widgets/custom_filtered_data_card.dart';

List<Map<String, dynamic>> demoItems = [
  {
    'value': "Highest Net Worth",
    'countryName': "Germany",
    'countryFlag': "🇩🇪",
    'tileClass': "5",
    'landTier': "Tier 2",
    'tiles': 90,
    'essence': 193.94785,
    'valuePercent': -100.00,
    'claims': "Zero",
  },
  {
    'value': "Most Tiles Owned",
    'countryName': "France",
    'countryFlag': "🇫🇷",
    'tileClass': "3",
    'landTier': "Tier 1",
    'tiles': 150,
    'essence': 254.12345,
    'valuePercent': -85.50,
    'claims': "Three",
  },
  {
    'value': "Top Essence Collector",
    'countryName': "Japan",
    'countryFlag': "🇯🇵",
    'tileClass': "2",
    'landTier': "Tier 3",
    'tiles': 70,
    'essence': 315.789,
    'valuePercent': -76.20,
    'claims': "One",
  },
  {
    'value': "Highest Land Tier",
    'countryName': "Brazil",
    'countryFlag': "🇧🇷",
    'tileClass': "4",
    'landTier': "Tier 5",
    'tiles': 60,
    'essence': 123.456,
    'valuePercent': -90.00,
    'claims': "Two",
  },
  {
    'value': "Essence Rich",
    'countryName': "Canada",
    'countryFlag': "🇨🇦",
    'tileClass': "1",
    'landTier': "Tier 1",
    'tiles': 120,
    'essence': 500.000,
    'valuePercent': -50.00,
    'claims': "Four",
  },
];

class FilteredDataScreen extends StatelessWidget {
  const FilteredDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomFilterScreenAppbar(),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: demoItems.length,
        itemBuilder: (context, index) {
          final item = demoItems[index];
          return GestureDetector(
            onTap: () {
              ViewLandDetailsScreen(userData: demoItems[index]);
            },
            child: CustomFilteredDataCard(
              value: item["value"],
              countryName: item["countryName"],
              countryFlag: item["countryFlag"],
              tileClass: item["tileClass"],
              landTier: item["landTier"],
              tiles: item["tiles"],
              essence: item["essence"],
              valuePercent: item["valuePercent"],
              claims: item["claims"],
              ontap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              ViewLandDetailsScreen(userData: demoItems[index]),
                    ),
                  ),
              ontapbuy: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomsheetProfileScreen(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
