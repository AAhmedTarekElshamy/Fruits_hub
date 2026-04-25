import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/terms_and_conditions.dart';

import '../../../../core/widgets/custom_text_field.dart';
import 'already_have_account.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHorizntalPadding),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            hintText: "full_name".tr(),
            textInputType: TextInputType.name,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: "email".tr(),
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: "password".tr(),
            textInputType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_red_eye_sharp,
                  color: Color(0xffC9CECF),
                )),
          ),
          const SizedBox(
            height: 16,
          ),
          const TermsAndConditions(),
          const SizedBox(
            height: 30,
          ),
          CustomButton(label: "create_new_account".tr(), onPressed: () {}),
          const SizedBox(
            height: 26,
          ),
          const AlreadyHaveAccount(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
