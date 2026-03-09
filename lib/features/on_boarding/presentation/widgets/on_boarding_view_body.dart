import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/services/shared_preferences_singleton.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../auth/presentation/views/login_view.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController  ;
  var currentIndex = 0;
  @override

  @override
  void initState() {

    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
    super.initState();
  }
  @override
  dispose(){
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: OnBoardingPageView(pageController: pageController,)),
          DotsIndicator(
            dotsCount: 2,
             mainAxisAlignment: MainAxisAlignment.center ,
            decorator: DotsDecorator(
              color:currentIndex==0? AppColors.lightGreenColor:AppColors.PrimaryColor,
              activeColor:  AppColors.PrimaryColor,
            ),

          ),
          SizedBox(
            height: 29,
          ),
          Visibility(
            visible:currentIndex==1?true:false,   //pageController.page!.round() !=0 ,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: KHorizntalPadding) ,
              child: CustomButton(
                onPressed:(){
                  Prefs.setBool(KIsOnBoardingViewSeen, true);
                  Navigator.of(context).pushReplacementNamed( LoginView.routeName );
                } ,
                label: "Start Now".tr(),

              ),
            ),
          ),
          SizedBox(
            height: 43,
          ),




        ],
      ),
    );
  }
}
