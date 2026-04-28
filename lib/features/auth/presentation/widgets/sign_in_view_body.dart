import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/dont_have_account_widget.dart';
import '../../../../core/widgets/password_field.dart';
import '../../../../core/widgets/social_button.dart';
import '../../../../gen/assets.gen.dart';
import '../cubits/signin/signin_cubit.dart';
import 'or_divider.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState>  formKey = GlobalKey<FormState>();
  AutovalidateMode  autoValidateMode = AutovalidateMode.disabled;
  late String email ,password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHorizntalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                onSaved: (value){
                  email = value!;
                },

                hintText: "email".tr(),
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),

              PasswordField(onSaved: (value) {
                            password = value!;
                         },),
              const  SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "forgot_password".tr(),
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
                  label: "login",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                       context.read<SignInCubit>().signIn(email, password);
                      // Navigator.pushNamed(context, '/home');
                    } else{
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
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
              SocialButton( onPressed: (){
                context.read<SignInCubit>().signInWithGoogle();
              },text: "login_google".tr(),icon: Assets.images.googleSocialIcons.path,),
              const  SizedBox(
                height: 16,
              ),
              SocialButton( onPressed: (){
                context.read<SignInCubit>().signInWithFacebook();
              },text: "login_facebook".tr(),icon: Assets.images.facebookSocialIcons.path,),

              const  SizedBox(
                height: 16,
              ),
              SocialButton( onPressed: (){
                context.read<SignInCubit>().signInWithApple();
              },text: "login_apple".tr(),icon: Assets.images.appleSocialIcons.path,),

            ],
          ),
        ),
      ),
    );
  }
}
