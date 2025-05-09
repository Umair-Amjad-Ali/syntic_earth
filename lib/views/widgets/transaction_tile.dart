import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/controllers/utils/models/trasnsaction.dart';

class TransactionTile extends StatelessWidget {
  final Transaction tx;

  const TransactionTile({super.key, required this.tx});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: width * 0.06,
            backgroundColor:
                tx.isIncoming ? AppColors.primaryColor : AppColors.alert,
            child: Icon(
              tx.isIncoming ? Icons.arrow_downward : Icons.arrow_upward,
              color: AppColors.black,
              size: width * 0.05,
            ),
          ),
          SizedBox(width: width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.name,
                  style: TextStyle(
                    fontSize: width * 0.045,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  tx.time,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: width * 0.03,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "${tx.isIncoming ? "+" : "-"}\$${tx.amount.abs()}",
            style: TextStyle(
              color: tx.isIncoming ? AppColors.primaryColor : AppColors.alert,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}
