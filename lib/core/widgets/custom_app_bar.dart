import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar( {required BuildContext context,required String title,}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    leading: GestureDetector(
      onTap:(){
        //Navigator.pop(context);
        context.setLocale(const Locale('ar'));

      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
    ),
    centerTitle: true,
  );
}