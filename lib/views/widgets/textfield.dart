import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/textfield_controller.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';

class Inputfield extends StatelessWidget {
  final Widget? sufficon;
  final Color? sufficoncolor;
  final String? hinttext;
  final bool isEmail;
  final bool isPassword;
  final bool obsecuretext;
  final bool isPasswordVisibility;
  final VoidCallback? toggleVisibility;
  final TextEditingController? controller;
  Inputfield({
    super.key,
    this.hinttext,
    this.sufficon,
    this.sufficoncolor,
    this.isEmail = false,
    this.controller,
    this.isPassword = false,
    this.toggleVisibility,
    this.isPasswordVisibility = false,
    this.obsecuretext = false,
  });

  final TextfieldController textfieldController = Get.put(
    TextfieldController(),
  );

  String? _validate(String? value) {
    if (isEmail) {
      if (value == null || value.isEmpty) return 'Email is required';
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    }

    if (isPassword) {
      if (value == null || value.isEmpty) return 'Password is required';
      if (value.length < 6) return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return TextFormField(
      controller: controller,
      validator: _validate,
      style: TextStyle(
        color: AppColors.textColor,
        fontSize: mediaQuery.width * 0.04,
      ),
      cursorColor: AppColors.textColor,
      obscureText: obsecuretext,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: mediaQuery.width * 0.035,
          vertical: mediaQuery.height * 0.015,
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(mediaQuery.width * 0.015),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediaQuery.width * 0.015),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        labelStyle: TextStyle(
          color: AppColors.textColor,
          fontSize: mediaQuery.width * 0.04,
        ),
        fillColor: AppColors.secondaryColor,
        filled: true,
        hintText: hinttext,
        suffixIcon:
            isPassword
                ? IconButton(
                  icon: Icon(
                    obsecuretext ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: toggleVisibility,
                )
                : sufficon,
        suffixIconColor: sufficoncolor,

        hintStyle: TextStyle(
          color: AppColors.textColor,
          fontSize: mediaQuery.width * 0.04,
        ),
      ),
    );
  }
}
