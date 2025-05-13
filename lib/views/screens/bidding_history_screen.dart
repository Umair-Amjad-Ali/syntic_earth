import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_wallet_appbar.dart';
import 'package:syntic_earth/views/widgets/bidding_history_card.dart';

class BiddingHistoryScreen extends StatelessWidget {
  BiddingHistoryScreen({super.key});

  final List<Map<String, dynamic>> propertyBidList = [
    {
      "date": "2023-06-22",
      "bid": "ThePhoenix",
      "marketValue": "£55,000.00",
      "price": "£51,000.00",
      "bids": "5",
      "yourOffer": "£52,000.00",
    },
    {
      "date": "2023-06-18",
      "bid": "ThePhoenix",
      "marketValue": "£53,000.00",
      "price": "£48,000.00",
      "bids": "7",
      "yourOffer": "£49,500.00",
    },
    {
      "date": "2023-05-10",
      "bid": "ThePhoenix",
      "marketValue": "£54,000.00",
      "price": "£50,500.00",
      "bids": "4",
      "yourOffer": "£51,000.00",
    },
    {
      "date": "2023-06-18",
      "bid": "ThePhoenix",
      "marketValue": "£53,500.00",
      "price": "£48,000.00",
      "bids": "6",
      "yourOffer": "£48,800.00",
    },
    {
      "date": "2023-05-10",
      "bid": "ThePhoenix",
      "marketValue": "£54,500.00",
      "price": "£50,500.00",
      "bids": "3",
      "yourOffer": "£51,200.00",
    },
    {
      "date": "2023-06-18",
      "bid": "ThePhoenix",
      "marketValue": "£53,000.00",
      "price": "£48,000.00",
      "bids": "8",
      "yourOffer": "£50,000.00",
    },
    {
      "date": "2023-05-10",
      "bid": "ThePhoenix",
      "marketValue": "£54,000.00",
      "price": "£50,500.00",
      "bids": "2",
      "yourOffer": "£50,800.00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,

      body: Column(
        children: [
          CustomWalletAppBar(
            title: "Bidding History",
            iconData: Icon(Icons.arrow_back_ios_new, color: AppColors.white),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: propertyBidList.length,
              itemBuilder: (context, index) {
                final item = propertyBidList[index];
                return BiddingHistoryCard(
                  date: item["date"],
                  bid: item["bid"],
                  marketValue: item["marketValue"],
                  price: item["price"],
                  bids: item["bids"],
                  offer: item["yourOffer"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
