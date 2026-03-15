import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Text.rich(
      TextSpan(
        text: "Don't have account ".tr(),
        style: TextStyles.semiBold16
            .copyWith(fontFamily: "Cairo", color: Color(0xff949D9E)),
        children: [
          TextSpan(
            text: "create account".tr(),
            style: TextStyles.semiBold16.copyWith(
              fontFamily: "Cairo",
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
