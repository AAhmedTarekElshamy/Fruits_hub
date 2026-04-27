import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/helper_functions/snackbar.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../cubits/signin/signin_cubit.dart';
import '../cubits/signin/signin_states.dart';
import '../widgets/sign_in_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(GetIt.I<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: "login".tr()),
        body: Builder(builder: (context) {
          return BlocConsumer<SignInCubit, SignInStates>(
              listener: (BuildContext context, state) {
            if (state is SignInSuccess) {
              showSnackBar(context,
                  message: "signup_success".tr(),
                  backgroundColor: Colors.green);
            } else if (state is SignInFailure) {
              showSnackBar(context,
                  message: state.message, backgroundColor: Colors.red);
            }
          }, builder: (context, state) {
            final isLoading = state is SignInLoading;
            return Stack(
              children: [
                SignInViewBody(),
                if (isLoading) const Center(child: CircularProgressIndicator()),
              ],
            );
          });
        }),
      ),
    );
  }
}
