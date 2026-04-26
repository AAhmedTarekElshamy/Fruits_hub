import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/helper_functions/snackbar.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../cubits/signup_cubit/cubit.dart';
import '../cubits/signup_cubit/state.dart';
import '../widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(GetIt.I<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          title: "new_account".tr(),
        ),
        body: Builder(builder: (context) {
          return BlocConsumer<SignupCubit, SignupStates>(
            listener: (context, state) {
              if (state is SignupSuccess) {
                showSnackBar(context,
                    message: "signup_success".tr(),
                    backgroundColor: Colors.green);
              } else if (state is SignupFailure) {
                showSnackBar(context,
                    message: state.message, backgroundColor: Colors.red);
              }
            },
            builder: (context, state) {
              final isLoading = state is SignupLoading;
              return Stack(
                children: [
                  SignupViewBody(),
                  if (isLoading)
                    const Center(child: CircularProgressIndicator()),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
