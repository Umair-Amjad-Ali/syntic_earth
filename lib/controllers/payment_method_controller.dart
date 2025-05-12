import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  var selectedMethod = "Credit Card".obs;

  void selectMethod(String method) {
    selectedMethod.value = method;
  }
}
