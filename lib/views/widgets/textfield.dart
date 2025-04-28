import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/textfield_controller.dart';

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
      style: TextStyle(color: Color(0xffb8c2ff)),
      cursorColor: Color(0xffb8c2ff),
      obscureText: obsecuretext,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Color(0xff0AF9E6)),
        ),
        labelStyle: TextStyle(color: Color(0xffb8c2ff)),
        fillColor: Color(0xff313150),
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
          color: Color(0xffb8c2ff),
          fontSize: mediaQuery.width * 0.04,
        ),
      ),
    );
  }
}
