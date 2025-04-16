import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/models/trasnsaction.dart';
import 'package:syntic_earth/views/screens/wallet/transfer_management.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_wallet_appBar.dart';
import 'package:syntic_earth/views/widgets/transaction_tile.dart';
import 'package:syntic_earth/views/widgets/wallet_action_button.dart';

class WalletManagement extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      name: "Sabrina",
      amount: 20,
      time: "11:00 AM",
      isIncoming: true,
      date: "Today",
    ),
    Transaction(
      name: "Sabrina",
      amount: 40,
      time: "11:00 AM",
      isIncoming: true,
      date: "Today",
    ),
    Transaction(
      name: "Sabrina",
      amount: 30,
      time: "11:00 AM",
      isIncoming: true,
      date: "Today",
    ),
    Transaction(
      name: "Rachel",
      amount: -9000,
      time: "10:00 AM",
      isIncoming: false,
      date: "Today",
    ),
    Transaction(
      name: "Rachel",
      amount: -900,
      time: "10:00 AM",
      isIncoming: false,
      date: "Today",
    ),
    Transaction(
      name: "Sabrina",
      amount: 20,
      time: "11:00 AM",
      isIncoming: true,
      date: "12 Feb",
    ),
    Transaction(
      name: "Rachel",
      amount: -9000,
      time: "10:00 AM",
      isIncoming: false,
      date: "12 Feb",
    ),
  ];

  WalletManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const CustomWalletAppBar(
            title: "Wallet",
            iconData: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.015,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Balance Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(width * 0.04),
                      decoration: BoxDecoration(
                        color: Color(0xFF151515),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Balance",
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(Icons.more_horiz, color: Colors.white),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            "\$20,000.47",
                            style: TextStyle(
                              fontSize: width * 0.07,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Row(
                            children: [
                              WalletActionButton(
                                label: "Add Cash",
                                onPressed: () {},
                              ),
                              WalletActionButton(
                                label: "Cash Out",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TransferScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),

                    // Transactions Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Transactions",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: width * 0.035,
                          ),
                        ),
                      ],
                    ),

                    ...groupTransactionsByDate(transactions).entries.map((
                      entry,
                    ) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.015),
                          Text(
                            entry.key,
                            style: TextStyle(
                              fontSize: width * 0.035,
                              color: Colors.grey,
                            ),
                          ),
                          ...entry.value.map((tx) => TransactionTile(tx: tx)),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
