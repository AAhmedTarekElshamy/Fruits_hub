import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/dont_have_account_widget.dart';
import '../../../../core/widgets/social_button.dart';
import '../../../../gen/assets.gen.dart';
import 'or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHorizntalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
              hintText: "Email".tr(),
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: "Password".tr(),
              textInputType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye_sharp,
                    color: Color(0xffC9CECF),
                  )),
            ),
            const  SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Did you forget your password?".tr(),
                  style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor, fontFamily: 'Cairo'),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
                label: "Login".tr(),
                onPressed: () {
                  // Navigator.pushNamed(context, '/home');
                }),
            const  SizedBox(
              height: 33,
            ),
           const DontHaveAccountWidget(),
            const  SizedBox(
             height: 37,
           ),
            const OrDivider(),

            const  SizedBox(
              height: 16,
            ),
            SocialButton( onPressed: (){},text: "Login with Google".tr(),icon: Assets.images.googleSocialIcons.path,),
            const  SizedBox(
              height: 16,
            ),
            SocialButton( onPressed: (){},text: "Login with Aplle".tr(),icon: Assets.images.appleSocialIcons.path,),
            const  SizedBox(
              height: 16,
            ),
            SocialButton( onPressed: (){},text: "Login with Facebook".tr(),icon: Assets.images.facebookSocialIcons.path,),

          ],
        ),
      ),
    );
  }
}
