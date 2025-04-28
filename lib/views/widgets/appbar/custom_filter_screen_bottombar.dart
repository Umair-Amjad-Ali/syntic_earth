import 'package:flutter/material.dart';

class CustomFilterScreenBottombar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomFilterScreenBottombar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {"icon": Icons.shopping_bag_outlined, "label": ""},
      {"icon": Icons.trending_up, "label": ""},
      {"icon": Icons.bar_chart, "label": ""},
      {"icon": Icons.person, "label": ""},
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
            child: Icon(
              item["icon"],
              color: isSelected ? Color(0xFF28E1C7) : Colors.white54,
            ),
          );
        }),
      ),
    );
  }
}
