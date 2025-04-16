import 'package:flutter/material.dart';
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
        color: Color(0xFF1D1D1D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: width * 0.06,
            backgroundColor:
                tx.isIncoming ? Colors.cyanAccent : Colors.pinkAccent,
            child: Icon(
              tx.isIncoming ? Icons.arrow_downward : Icons.arrow_upward,
              color: Colors.black,
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
                    color: Colors.white,
                  ),
                ),
                Text(
                  tx.time,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: width * 0.03,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "${tx.isIncoming ? "+" : "-"}\$${tx.amount.abs()}",
            style: TextStyle(
              color: tx.isIncoming ? Colors.greenAccent : Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}
