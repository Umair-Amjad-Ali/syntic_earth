import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/payment_method_controller.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_wallet_appbar.dart';
import 'package:syntic_earth/views/widgets/button.dart';
import 'package:syntic_earth/views/widgets/textfield.dart';

class PaymentMethodsScreen extends StatelessWidget {
  PaymentMethodsScreen({super.key});

  final List<Map<String, String>> paymentMethods = [
    {"name": "Credit Card", "icon": "assets/images/mastercard.svg"},
    {"name": "PayPal", "icon": "assets/images/paypal.svg"},
    {"name": "Google Pay", "icon": "assets/images/google.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    final PaymentMethodController paymentMethodController = Get.put(
      PaymentMethodController(),
    );
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomWalletAppBar(
        title: "Payment Methods",
        iconData: Icon(Icons.arrow_back, color: AppColors.white),
      ),
      body: SizedBox(
        width: mediaQuery.width,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...paymentMethods.map((method) {
                  return Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            method["icon"]!,
                            height: mediaQuery.height * 0.06,
                            width: mediaQuery.width * 0.06,
                          ),
                          SizedBox(width: mediaQuery.width * 0.05),
                          Expanded(
                            child: Text(
                              method["name"]!,
                              style: TextStyle(color: AppColors.textColor),
                            ),
                          ),
                          Radio(
                            value: method["name"],
                            groupValue:
                                paymentMethodController.selectedMethod.value,
                            onChanged: (value) {
                              paymentMethodController.selectMethod(value!);
                            },
                            activeColor: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                SizedBox(height: mediaQuery.height * 0.04),
                Inputfield(hinttext: "Full Name"),
                SizedBox(height: mediaQuery.height * 0.02),
                Inputfield(hinttext: "Card Number"),
                SizedBox(height: mediaQuery.height * 0.02),
                Inputfield(hinttext: "Expiration Date"),
                SizedBox(height: mediaQuery.height * 0.02),
                Inputfield(hinttext: "CVV"),
                SizedBox(height: mediaQuery.height * 0.02),
                Buttonwidget(text: "Save", color: AppColors.primaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
