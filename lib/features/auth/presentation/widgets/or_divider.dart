import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: Color(0xff949D9E),
            ),
          ),
        SizedBox(width: 17.8,),
        Text('Or'.tr(),style:  TextStyles.semiBold16.copyWith(fontFamily: "Cairo",color: Color(0xff0C0D0D)),),
        SizedBox(width: 17.8,),
        Expanded(
          child: Divider(
            thickness: 1,
            height: 30,

            color: Color(0xff949D9E),
          ),
        ),
      ],
    );
  }
}
/*
Row(
  children: [
    Expanded(
      child: Divider(
        thickness: 1,
        color: Color(0xffE6E9EA),
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "OR",
        style: TextStyle(
          color: Color(0xff949D9E),
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    Expanded(
      child: Divider(
        thickness: 1,
        color: Color(0xffE6E9EA),
      ),
    ),
  ],
)
* */