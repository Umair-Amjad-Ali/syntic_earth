import 'package:flutter/material.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_wallet_appbar.dart';
import 'package:syntic_earth/views/widgets/property_history_card.dart';

class PropertyHistoryScreen extends StatelessWidget {
  PropertyHistoryScreen({super.key});

  final List<Map<String, dynamic>> propertyHistoryList = [
    {
      "date": '2023-06-22',
      "pricePaid": '£51,000.00',
      "improvementFee": '£90.00',
      "from": 'Nobids',
      "to": 'KavaLan',
    },
    {
      "date": '2023-06-18',
      "pricePaid": '£48,000.00',
      "improvementFee": '£85.00',
      "from": 'User123',
      "to": 'EarthyOne',
    },
    {
      "date": '2023-05-10',
      "pricePaid": '£50,500.00',
      "improvementFee": '£75.00',
      "from": 'Maplord',
      "to": 'KavaLan',
    },
    {
      "date": '2023-06-18',
      "pricePaid": '£48,000.00',
      "improvementFee": '£85.00',
      "from": 'User123',
      "to": 'EarthyOne',
    },
    {
      "date": '2023-05-10',
      "pricePaid": '£50,500.00',
      "improvementFee": '£75.00',
      "from": 'Maplord',
      "to": 'KavaLan',
    },
    {
      "date": '2023-06-18',
      "pricePaid": '£48,000.00',
      "improvementFee": '£85.00',
      "from": 'User123',
      "to": 'EarthyOne',
    },
    {
      "date": '2023-05-10',
      "pricePaid": '£50,500.00',
      "improvementFee": '£75.00',
      "from": 'Maplord',
      "to": 'KavaLan',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [
          CustomWalletAppBar(
            title: "Property History",
            iconData: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: propertyHistoryList.length,
              itemBuilder: (context, index) {
                final item = propertyHistoryList[index];
                return PropertyHistoryCard(
                  date: item["date"],
                  pricePaid: item["pricePaid"],
                  improvementFee: item["improvementFee"],
                  from: item["from"],
                  to: item["to"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
