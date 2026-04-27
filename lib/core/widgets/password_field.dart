// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// import 'custom_text_field.dart';
//
// Widget buildPasswordField({
//   required Function(String?) onSaved,
//   required VoidCallback onToggleVisibility,
// }) {
//   return CustomTextField(
//     obscureText: true,
//     hintText: "password".tr(),
//     textInputType: TextInputType.visiblePassword,
//     suffixIcon: IconButton(
//       onPressed: onToggleVisibility,
//       icon: const Icon(
//         Icons.remove_red_eye_sharp,
//         color: Color(0xffC9CECF),
//       ),
//     ),
//     onSaved: onSaved,
//   );
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.onSaved,
  });

  final Function(String?) onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;

  void toggleVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obscureText: isObscure,
      onSaved: widget.onSaved,
      hintText: "password".tr(),
      textInputType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        onPressed: toggleVisibility,
        icon: Icon(
          isObscure
              ? Icons.visibility_off
              : Icons.remove_red_eye_sharp,
          color: const Color(0xffC9CECF),
        ),
      ),

    );
  }
}