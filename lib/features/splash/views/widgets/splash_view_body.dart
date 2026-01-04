import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  @override
  void initState()  {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset(Assets.images.plant)],
        ),
        SvgPicture.asset(Assets.images.logo),
        SvgPicture.asset(
          Assets.images.splashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }


  void executeNavigation() {
    Future.delayed(
        const Duration(seconds: 3),
            () {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        });
  }
/*
*   void executeNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
        ),
      );
    });
  }
*/

}
