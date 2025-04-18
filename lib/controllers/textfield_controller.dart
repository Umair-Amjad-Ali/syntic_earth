import 'package:get/get.dart';

class TextfieldController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisibility = false.obs;
  var checkBoxValue = true.obs;
  var isPasswordsMatching = false.obs;
  var selectedIndex = 0.obs;
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisibility.value = !isConfirmPasswordVisibility.value;
  }

   void checkPasswordMatch(String password, String confirmPassword) {
    if (password == confirmPassword) {
      isPasswordsMatching.value = true;
    } else {
      isPasswordsMatching.value = false;
    }
  }
}
