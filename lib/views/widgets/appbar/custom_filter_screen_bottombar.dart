import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';

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
        color: AppColors.filterbgColor,
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
              color: isSelected ? AppColors.primaryColor : AppColors.textColor,
            ),
          );
        }),
      ),
    );
  }
}
