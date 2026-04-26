import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void showSnackBar(
    BuildContext context, {
      required String message,
      Color backgroundColor = Colors.black,
    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ),
  );
}