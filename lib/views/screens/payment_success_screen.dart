import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/screens/onboarding/welcome_screen.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_wallet_appbar.dart';
import 'package:syntic_earth/views/widgets/button.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomWalletAppBar(
        title: "",
        iconData: Icon(Icons.arrow_back, color: AppColors.white),
      ),
      body: SizedBox(
        width: mediaQuery.width,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 5, color: AppColors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset("assets/images/paymentCheck.svg"),
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.02),
              DottedLine(
                dashGapLength: 7,
                dashColor: AppColors.grey,
                lineLength: mediaQuery.width * 0.7,
              ),
              SizedBox(height: mediaQuery.height * 0.02),
              Text(
                "Payment Successful",
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.02),
              SizedBox(
                width: mediaQuery.width * 0.5,
                child: Text(
                  '"Your payment was completed successfully"',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textColor),
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.15),
              Buttonwidget(
                text: "Download Receipt (PDF)",
                borderColor: AppColors.primaryColor,
              ),
              SizedBox(height: mediaQuery.height * 0.01),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
                child: Text(
                  "Back To Home",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
