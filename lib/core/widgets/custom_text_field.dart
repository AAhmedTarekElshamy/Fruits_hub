import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.textInputType,  this.suffixIcon});
final String hintText;
final TextInputType textInputType;
final Widget?  suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF9FAFA),
        hintText:hintText,
        hintStyle: TextStyles.bold13.copyWith(color: Color(0xff949D9E),fontFamily: 'Cairo'),

          suffixIcon: suffixIcon,

        border: buildOutlineBorder(),
        enabledBorder: buildOutlineBorder(),
        focusedBorder: buildOutlineBorder(),


      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }
  OutlineInputBorder buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: Color(0xFFE6E9EE),
      ),
    );
  }
}
