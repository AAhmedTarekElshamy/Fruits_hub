import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/on_boarding/data/models/page_view_item_model.dart';
import 'package:fruits_hub/features/on_boarding/presentation/widgets/page_view_item.dart';

import '../../../../constants.dart';
import '../../../../core/services/shared_preferences_singleton.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/presentation/views/login_view.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          pageViewItemModel: PageViewItemModel(
            image: Assets.images.pageViewItem1Image.path,
            backgroundImage: Assets.images.pageViewItem1BackgroundImage.path,
            subTitle:
            "Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals with high quality."
                .tr(),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello in'.tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                    color: Color(0xff0C0D0D),
                  ),
                ),
                const SizedBox(width: 4),
                context.locale.languageCode == 'en'
                    ? Row(
                  children: [
                    Text(
                      'Fruit'.tr(),
                      style: const TextStyle(
                        color: Color(0xff1B5E37),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                      ),
                    ),
                    Text(
                      'HUB'.tr(),
                      style: const TextStyle(
                        color: Color(0xffF4A91F),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                      ),
                    ),
                  ],
                )
                    : Row(
                  children: [
                    Text(
                      'HUB'.tr(),
                      style: const TextStyle(
                        color: Color(0xffF4A91F),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                      ),
                    ),
                    Text(
                      'Fruit'.tr(),
                      style: const TextStyle(
                        color: Color(0xff1B5E37),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          onSkip: () {
            Prefs.setBool(KIsOnBoardingViewSeen, true);
            Navigator.of(context).pushReplacementNamed(LoginView.routeName);
          },
          isVisible: true,
        ),
        PageViewItem(
          pageViewItemModel: PageViewItemModel(
            image: Assets.images.pageViewItem2Image.path,
            backgroundImage: Assets.images.pageViewItem2BackgroundImage.path,
            subTitle:
            "We provide you with the finest carefully selected fruits. Check out the details, photos, and reviews to ensure you choose the perfect fruit."
                .tr(),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "search and shop".tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                    color: Color(0xff0C0D0D),
                  ),
                ),
              ],
            ),
          ),
          onSkip: () {
            Navigator.of(context).pushReplacementNamed(LoginView.routeName);
          },
          isVisible: false,
        ),
      ],
    );
  }
}