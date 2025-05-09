import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/screens/private_chat_screen.dart';

class MarketplaceCard extends StatelessWidget {
  final String location;
  final String tiles;
  final String listedBy;
  final String price;
  final List<String> tags;
  final IconData icon;
  const MarketplaceCard({
    super.key,
    required this.location,
    required this.tiles,
    required this.listedBy,
    required this.price,
    required this.tags,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // Size mediaQuery = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth;
        return Card(
          elevation: 6,
          shadowColor: AppColors.white.withAlpha(153),
          color: AppColors.textFieldColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar/Icon
                    Container(
                      height: cardWidth * 0.12,
                      width: cardWidth * 0.12,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        icon,
                        color: AppColors.primaryColor,
                        size: cardWidth * 0.06,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            location,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: cardWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            tiles,
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: cardWidth * 0.035,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            listedBy,
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: cardWidth * 0.03,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Labels
                          Row(
                            children:
                                tags
                                    .map((tag) => _buildTag(tag, cardWidth))
                                    .toList(),
                          ),
                        ],
                      ),
                    ),

                    // Price and Button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: cardWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // const SizedBox(height: 16),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: cardWidth * 0.05,
                        vertical: cardWidth * 0.02,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => PrivateChatScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: cardWidth * 0.035,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTag(String label, double width) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.025,
          vertical: width * 0.01,
        ),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: width * 0.025,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
