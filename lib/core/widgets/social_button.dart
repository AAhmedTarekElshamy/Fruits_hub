import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_text_styles.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return Container(
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE6E9EA),width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  text,
                  style:   TextStyles.semiBold16.copyWith(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    color: Color(0xff0C0D0D),
                    height: 1.4,
                  ),
                ),
              ),
              Positioned(
                right: isArabic ? 0 : null,
                left: isArabic ? null : 0,
                child: SvgPicture.asset(icon, height: 24, width: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}