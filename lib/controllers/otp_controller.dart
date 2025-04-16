import 'package:get/get.dart';

class OtpController extends GetxController {
  var otpCode = ''.obs;
  var isError = false.obs;

  void updateOtp(String code) {
    otpCode.value = code;
  }

  bool validateOtp() {
    if (otpCode.value.length != 4 || otpCode.value.contains(' ')) {
      isError.value = true;
      return false;
    }
    isError.value = false;
    return true;
  }

  void clearOtp() {
    otpCode.value = "";
    isError.value = false;
  }
}
