import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Small Dash at the top
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          // Tiles In Total
          const Text(
            "20 Tiles In Total",
            style: TextStyle(color: Colors.tealAccent, fontSize: 14),
          ),

          const SizedBox(height: 12),

          // User Avatar
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.tealAccent,
            child: Icon(Icons.person, color: Colors.black, size: 30),
          ),

          const SizedBox(height: 8),

          // Username
          const Text(
            "User23324324",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // Location
          Column(
            children: const [
              Text(
                "RAID-SET Yau Tsim Mong District, Hong Kong",
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                "Yau Tsim Mong District, Hong Kong",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 4),
              Text(
                "@ (22.324195, 114.17284)",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Market Values
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Market Value: ", style: TextStyle(color: Colors.white)),
              Text("E\$150.00 ", style: TextStyle(color: Colors.cyanAccent)),
              Text("(Per Tile: ", style: TextStyle(color: Colors.white)),
              Text("E\$50.200", style: TextStyle(color: Colors.redAccent)),
              Text(")", style: TextStyle(color: Colors.white)),
            ],
          ),

          const SizedBox(height: 4),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("New land value: ", style: TextStyle(color: Colors.white)),
              Text("E\$150.00 ", style: TextStyle(color: Colors.cyanAccent)),
              Text("(Per Tile: ", style: TextStyle(color: Colors.white)),
              Text("E\$50.200", style: TextStyle(color: Colors.redAccent)),
              Text(")", style: TextStyle(color: Colors.white)),
            ],
          ),

          const SizedBox(height: 16),

          // Property Info Button
          SizedBox(
            width: 200,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Property Info",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Bids Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // No Bids
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: const [
                        Text("No bids", style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 4),
                        Text("Bid", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Your Offer
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          "Your Offer",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text("Offer", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Price and Market Value
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // Price
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: const [
                        Text("Price", style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 4),
                        Text(
                          "E\$1,000.00",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Market Value
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Market Value",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "E\$150.00 ",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            Text(
                              "(-85.00%)",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Bidding History and Property History Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Bidding History
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Bidding History",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Property History
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Property History",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
