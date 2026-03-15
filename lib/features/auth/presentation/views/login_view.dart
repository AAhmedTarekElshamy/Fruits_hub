import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/login_view_body.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});
   static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: buildAppBar( context: context, title: 'Login'.tr()),

      body: const LoginViewBody(),
    );
  }

}
