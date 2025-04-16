// ignore: file_names
import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var isChecked = false.obs;

  void toggleCheckBox(bool? value) {
    isChecked.value = value ?? false;
  }
}
