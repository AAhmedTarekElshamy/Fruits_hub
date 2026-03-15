import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_view.dart';

import '../../../../constants.dart';
import '../../../../core/services/shared_preferences_singleton.dart';
import '../../../../gen/assets.gen.dart';
import '../../../on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: context.locale.languageCode == 'en'
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [Assets.images.plant.svg()],
        ),
        Assets.images.logo.svg(),
        Assets.images.splashBottom.svg(fit: BoxFit.fill),
      ],
    );
  }

  void executeNavigation() {
    Future.delayed(
      const Duration(seconds: 3),
          () async {
        bool isOnBoardingViewSeen = Prefs.getBool(KIsOnBoardingViewSeen);
        if (isOnBoardingViewSeen == false) {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      },
    );
  }
}