import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart'; // ✅ Added
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';


class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "already_have_account".tr(),
        style: TextStyles.semiBold16
            .copyWith(fontFamily: "Cairo", color: const Color(0xff949D9E)),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            text: "login".tr(),
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