import 'package:flutter/material.dart';
import 'package:syntic_earth/views/widgets/button.dart';

class CustomFilteredDataCard extends StatelessWidget {
  final String value;
  final String countryName;
  final String countryFlag;
  final String tileClass;
  final String landTier;
  final int tiles;
  final double essence;
  final double valuePercent;
  final String claims;
  final bool showButtons;
  final VoidCallback ontap;
  final VoidCallback ontapbuy;
  const CustomFilteredDataCard({
    super.key,
    required this.value,
    required this.countryName,
    required this.countryFlag,
    required this.tileClass,
    required this.landTier,
    required this.tiles,
    required this.essence,
    required this.valuePercent,
    required this.claims,
    required this.ontap,
    this.showButtons = true, required this.ontapbuy,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF1B1C2B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      margin: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),

                Expanded(child: _labelValue("Value", value)),
                SizedBox(width: 10),

                Expanded(
                  child: _labelValue("Country", "$countryFlag $countryName"),
                ),
                SizedBox(width: 10),

                Expanded(child: _labelValue("Tile Class ", tileClass)),
                SizedBox(width: 10),

                Expanded(child: _labelValue("Land Tier", landTier)),
                SizedBox(width: 10),
              ],
            ),

            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),

                Expanded(child: _labelValue("Tiles", tiles.toString())),
                SizedBox(width: 10),
                Expanded(child: _labelValue("Essence", essence.toString())),
                SizedBox(width: 10),

                Expanded(
                  child: _labelValue("% Value ", valuePercent.toString()),
                ),
                SizedBox(width: 10),

                Expanded(child: _labelValue("Claims ", claims)),
                SizedBox(width: 10),
              ],
            ),

            if (showButtons) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Buttonwidget(
                      borderColor: Colors.cyanAccent,
                      text: "View",
                      ontapped: ontap,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Buttonwidget(
                      color: Colors.cyanAccent,
                      text: "Buy",
                      ontapped: ontapbuy,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

Widget _labelValue(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        child: Text(
          value,
          style: TextStyle(color: Colors.white70, fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
