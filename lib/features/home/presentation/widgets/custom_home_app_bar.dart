import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xffEEF1F1),
          child: Assets.images.appBarImage.svg(),
        ),
        const SizedBox(
          width: 11,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "good_morning".tr(),
              style: TextStyles.regular16.copyWith(
                color: const Color(0xff949D9E),
              ),
            ),
            Text(
              "ahmed_tarek".tr(),
              style: TextStyles.bold16.copyWith(
                color: const Color(0xff0C0D0D),
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffEEF1F1),
          ),
          child: Assets.images.notification.svg(),
        ),
      ],
    );
  }
}
