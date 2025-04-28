import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {"icon": Icons.map, "label": "Market"},
      {"icon": Icons.ondemand_video, "label": "Market"},
      {"icon": Icons.location_on, "label": "My Land"},
      {"icon": Icons.account_balance_wallet, "label": "Wallet"},
      {"icon": Icons.person, "label": "Profile"},
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1B1C2B),
        // borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item["icon"],
                  color: isSelected ? const Color(0xFFB5C2F1) : Colors.white54,
                ),
                const SizedBox(height: 4),
                Text(
                  item["label"],
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        isSelected ? const Color(0xFFB5C2F1) : Colors.white54,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
