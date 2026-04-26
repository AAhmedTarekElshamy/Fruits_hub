import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

import '../../../../core/utils/app_text_styles.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});
final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 28,
          height: 28,
          child: Transform.scale(
            scale: 1.5,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                  widget.onChanged(value);
                });
              },
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width -
              (2 * KHorizntalPadding + (70)),
          child: RichText(
            textDirection: Directionality.of(context),
            text: TextSpan(
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xff949D9E),
                fontFamily: 'Cairo',
                height: 1.4,
              ),
              children: [
                TextSpan(text: "agree_terms".tr()),
                const TextSpan(text: " "),
                TextSpan(
                  text: "terms_and_conditions".tr(),
                  style: TextStyles.semiBold16.copyWith(
                    color: AppColors.lightPrimaryColor,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
