import 'package:flutter/material.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_wallet_appbar.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  String amount = "";

  void _onKeyTap(String value) {
    setState(() {
      if (value == "back") {
        if (amount.isNotEmpty) {
          amount = amount.substring(0, amount.length - 1);
        }
      } else if (value == ".") {
        if (!amount.contains(".")) {
          amount += value;
        }
      } else {
        amount += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const CustomWalletAppBar(
              title: "Transfer",
              iconData: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: height * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.02),

                    // Amount Display
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "\$${amount.isEmpty ? "0" : amount}",
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: width * 0.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.005),
                    Text(
                      "Current Balance : \$20,000",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: width * 0.035,
                      ),
                    ),
                    SizedBox(height: height * 0.05),

                    // Number Pad
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 3; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(3, (j) {
                                int num = i * 3 + j + 1;
                                return _buildKey("$num", width);
                              }),
                            ),
                          SizedBox(height: height * 0.015),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildKey("0", width),
                              _buildKey(".", width),
                              _buildKey("back", width),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Send Button
                    SizedBox(height: height * 0.02),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyanAccent,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.02,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Send",
                          style: TextStyle(fontSize: width * 0.045),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKey(String value, double width) {
    IconData? icon = value == "back" ? Icons.backspace : null;

    return GestureDetector(
      onTap: () => _onKeyTap(value),
      child: Container(
        margin: EdgeInsets.all(width * 0.02),
        width: width * 0.18,
        height: width * 0.18,
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          shape: BoxShape.circle,
        ),
        child: Center(
          child:
              icon != null
                  ? Icon(icon, color: Colors.white, size: width * 0.06)
                  : value == "."
                  ? Container(
                    width: width * 0.02,
                    height: width * 0.02,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  )
                  : Text(
                    value,
                    style: TextStyle(
                      fontSize: width * 0.06,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        ),
      ),
    );
  }
}
