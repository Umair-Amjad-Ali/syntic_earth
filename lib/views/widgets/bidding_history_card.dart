import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';

class BiddingHistoryCard extends StatelessWidget {
  final String date;
  final String bid;
  final String marketValue;
  final String price;
  final String bids;
  final String offer;

  const BiddingHistoryCard({
    super.key,
    required this.date,
    required this.bid,
    required this.marketValue,
    required this.price,
    required this.bids,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.textFieldColor, // Main card background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Top Date Bar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Date : ',
                  style: TextStyle(color: AppColors.white, fontSize: 14),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.historyScreenTextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Divider Line
          const Divider(color: Colors.white12, thickness: 1, height: 0),

          // Card Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Row 1: Price Paid + Improvement Fee
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildLabelValuePair(
                        'Bid',
                        bid,
                        valueColor: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: _buildLabelValuePair(
                        'Market Value',
                        marketValue,
                        valueColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(color: Colors.white12, thickness: 1, height: 0),

              // Row 2: From + To
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildLabelValuePair(
                        'Price',
                        price,
                        valueColor: AppColors.textColor,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(child: _buildLabelValuePair('Bids', bids)),
                  ],
                ),
              ),

              const Divider(color: Colors.white12, thickness: 1, height: 0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: _buildLabelValuePair('Your Offer', offer)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLabelValuePair(
    String label,
    String value, {
    Color valueColor = AppColors.textColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(value, style: TextStyle(color: valueColor, fontSize: 13)),
      ],
    );
  }
}
