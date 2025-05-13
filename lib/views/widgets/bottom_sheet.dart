import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/screens/bidding_history_screen.dart';
import 'package:syntic_earth/views/screens/property_history_screen.dart';
import 'package:syntic_earth/views/widgets/button.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Dash
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          const SizedBox(height: 12),
          _textWithIcon(Icons.grid_view, "20 Tiles In Total"),

          const SizedBox(height: 12),
          const CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.person, color: AppColors.black, size: 30),
          ),
          const SizedBox(height: 8),
          const Text(
            "User23324324",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("🇯🇵", style: TextStyle(fontSize: 25)),
          const SizedBox(height: 8),

          const Column(
            children: [
              Text(
                "RAID-SET Yau Tsim Mong District, Hong Kong",
                style: TextStyle(color: AppColors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                "Yau Tsim Mong District, Hong Kong",
                style: TextStyle(color: AppColors.grey, fontSize: 12),
              ),
              Text(
                "@ (22.324195, 114.17284)",
                style: TextStyle(color: AppColors.grey, fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _valueRow("Market Value", "E\$150.00", "E\$50.200"),
          _valueRow("New land value", "E\$150.00", "E\$50.200"),

          const SizedBox(height: 16),

          SizedBox(
            width: width * 0.6,
            height: 45,
            child: Buttonwidget(
              text: "Property info",
              color: AppColors.primaryColor,
            ),
          ),

          const SizedBox(height: 16),
          _infoRow([
            _infoBox("No bids", "Bid"),
            _infoBox("Your Offer", "Offer"),
          ]),
          const SizedBox(height: 12),
          _infoRow([
            _infoBox("Price", "E\$1,000.00"),
            _marketValueBox("Market Value", "E\$150.00", "-85.00%"),
          ]),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Buttonwidget(
                    text: "Bidding History",
                    borderColor: AppColors.primaryColor,
                    ontapped:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BiddingHistoryScreen(),
                          ),
                        ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Buttonwidget(
                    text: "Property History",
                    color: AppColors.primaryColor,
                    ontapped:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PropertyHistoryScreen(),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textWithIcon(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.primaryColor, size: 18),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(color: AppColors.primaryColor, fontSize: 14),
        ),
      ],
    );
  }

  Widget _valueRow(String label, String value, String perTile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$label: ", style: const TextStyle(color: AppColors.white)),
        Text("$value ", style: const TextStyle(color: AppColors.primaryColor)),
        const Text("(Per Tile: ", style: TextStyle(color: AppColors.white)),
        Text(perTile, style: const TextStyle(color: AppColors.alert)),
        const Text(")", style: TextStyle(color: AppColors.white)),
      ],
    );
  }

  Widget _infoRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            Expanded(child: children[i]),
          ],
        ],
      ),
    );
  }

  Widget _infoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: AppColors.grey)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: AppColors.white)),
        ],
      ),
    );
  }

  Widget _marketValueBox(String title, String value, String change) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: AppColors.grey)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value, style: const TextStyle(color: AppColors.alert)),
              const SizedBox(width: 4),
              Text(
                change,
                style: const TextStyle(color: AppColors.alert, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

