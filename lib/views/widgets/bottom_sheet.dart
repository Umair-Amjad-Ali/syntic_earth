import 'package:flutter/material.dart';
import 'package:syntic_earth/views/screens/bidding_history_screen.dart';
import 'package:syntic_earth/views/screens/property_history_screen.dart';
import 'package:syntic_earth/views/widgets/button.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Dash
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          _textWithIcon(Icons.grid_view, "20 Tiles In Total"),

          const SizedBox(height: 12),
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.tealAccent,
            child: Icon(Icons.person, color: Colors.black, size: 30),
          ),
          const SizedBox(height: 8),
          const Text(
            "User23324324",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("🇯🇵", style: TextStyle(fontSize: 25)),
          const SizedBox(height: 8),

          const Column(
            children: [
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
              Text(
                "@ (22.324195, 114.17284)",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _valueRow("Market Value", "E\$150.00", "E\$50.200"),
          _valueRow("New land value", "E\$150.00", "E\$50.200"),

          const SizedBox(height: 16),

          SizedBox(
            width: width * 0.6,
            height: 45,
            child: Buttonwidget(
              text: "Property info",
              color: Colors.cyanAccent,
            ),
          ),

          const SizedBox(height: 16),
          _infoRow([
            _infoBox("No bids", "Bid"),
            _infoBox("Your Offer", "Offer"),
          ]),
          const SizedBox(height: 12),
          _infoRow([
            _infoBox("Price", "E\$1,000.00"),
            _marketValueBox("Market Value", "E\$150.00", "-85.00%"),
          ]),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Buttonwidget(
                    text: "Bidding History",
                    borderColor: Colors.cyanAccent,
                    ontapped:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BiddingHistoryScreen(),
                          ),
                        ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Buttonwidget(
                    text: "Property History",
                    color: Colors.cyanAccent,
                    ontapped:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PropertyHistoryScreen(),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textWithIcon(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.cyanAccent, size: 18),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(color: Colors.cyanAccent, fontSize: 14),
        ),
      ],
    );
  }

  Widget _valueRow(String label, String value, String perTile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$label: ", style: const TextStyle(color: Colors.white)),
        Text("$value ", style: const TextStyle(color: Colors.cyanAccent)),
        const Text("(Per Tile: ", style: TextStyle(color: Colors.white)),
        Text(perTile, style: const TextStyle(color: Colors.redAccent)),
        const Text(")", style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _infoRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            Expanded(child: children[i]),
          ],
        ],
      ),
    );
  }

  Widget _infoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _marketValueBox(String title, String value, String change) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value, style: const TextStyle(color: Colors.redAccent)),
              const SizedBox(width: 4),
              Text(
                change,
                style: const TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:syntic_earth/views/screens/bidding_history_screen.dart';
// import 'package:syntic_earth/views/screens/property_history_screen.dart';
// import 'package:syntic_earth/views/widgets/button.dart';

// class BottomSheetWidget extends StatelessWidget {
//   const BottomSheetWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // Small Dash at the top
//         Container(
//           margin: const EdgeInsets.only(top: 8, bottom: 16),
//           width: 40,
//           height: 4,
//           decoration: BoxDecoration(
//             color: Colors.grey[700],
//             borderRadius: BorderRadius.circular(4),
//           ),
//         ),

//         // Tiles In Total
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.grid_view, color: Colors.cyanAccent),
//             SizedBox(width: 5),
//             const Text(
//               "20 Tiles In Total",
//               style: TextStyle(color: Colors.cyanAccent, fontSize: 14),
//             ),
//           ],
//         ),

//         const SizedBox(height: 12),

//         // User Avatar
//         const CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.tealAccent,
//           child: Icon(Icons.person, color: Colors.black, size: 30),
//         ),

//         const SizedBox(height: 8),

//         // Username
//         const Text(
//           "User23324324",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 8),

//         // Username
//         const Text("🇯🇵", style: TextStyle(fontSize: 25)),

//         const SizedBox(height: 8),

//         // Location
//         Column(
//           children: const [
//             Text(
//               "RAID-SET Yau Tsim Mong District, Hong Kong",
//               style: TextStyle(color: Colors.white, fontSize: 14),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 4),
//             Text(
//               "Yau Tsim Mong District, Hong Kong",
//               style: TextStyle(color: Colors.grey, fontSize: 12),
//             ),
//             SizedBox(height: 4),
//             Text(
//               "@ (22.324195, 114.17284)",
//               style: TextStyle(color: Colors.grey, fontSize: 12),
//             ),
//           ],
//         ),

//         const SizedBox(height: 16),

//         // Market Values
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Market Value: ", style: TextStyle(color: Colors.white)),
//             Text("E\$150.00 ", style: TextStyle(color: Colors.cyanAccent)),
//             Text("(Per Tile: ", style: TextStyle(color: Colors.white)),
//             Text("E\$50.200", style: TextStyle(color: Colors.redAccent)),
//             Text(")", style: TextStyle(color: Colors.white)),
//           ],
//         ),

//         const SizedBox(height: 4),

//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("New land value: ", style: TextStyle(color: Colors.white)),
//             Text("E\$150.00 ", style: TextStyle(color: Colors.cyanAccent)),
//             Text("(Per Tile: ", style: TextStyle(color: Colors.white)),
//             Text("E\$50.200", style: TextStyle(color: Colors.redAccent)),
//             Text(")", style: TextStyle(color: Colors.white)),
//           ],
//         ),

//         const SizedBox(height: 16),

//         // Property Info Button
//         SizedBox(
//           width: 200,
//           height: 45,
//           child: Buttonwidget(text: "Property info", color: Colors.cyanAccent),
//         ),

//         const SizedBox(height: 16),

//         // Bids Section
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Row(
//             children: [
//               // No Bids
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[850],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     children: const [
//                       Text("No bids", style: TextStyle(color: Colors.grey)),
//                       SizedBox(height: 4),
//                       Text("Bid", style: TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(width: 8),

//               // Your Offer
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[850],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     children: const [
//                       Text("Your Offer", style: TextStyle(color: Colors.grey)),
//                       SizedBox(height: 4),
//                       Text("Offer", style: TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(height: 12),

//         // Price and Market Value
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Row(
//             children: [
//               // Price
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[850],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     children: const [
//                       Text("Price", style: TextStyle(color: Colors.grey)),
//                       SizedBox(height: 4),
//                       Text(
//                         "E\$1,000.00",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(width: 8),

//               // Market Value
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[850],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     children: [
//                       const Text(
//                         "Market Value",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Text(
//                             "E\$150.00 ",
//                             style: TextStyle(color: Colors.redAccent),
//                           ),
//                           Text(
//                             "(-85.00%)",
//                             style: TextStyle(
//                               color: Colors.redAccent,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(height: 16),

//         // Bidding History and Property History Buttons
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             children: [
//               // Bidding History
//               Expanded(
//                 child: Buttonwidget(
//                   text: "Bidding History",
//                   borderColor: Colors.cyanAccent,
//                   ontapped: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (contex) => BiddingHistoryScreen(),
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               const SizedBox(width: 8),

//               // Property History
//               Expanded(
//                 child: Buttonwidget(
//                   text: "Property History",
//                   color: Colors.cyanAccent,
//                   ontapped: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (contex) => PropertyHistoryScreen(),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(height: 16),
//       ],
//     );
//   }
// }
