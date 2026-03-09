import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';


import '../../data/models/page_view_item_model.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.pageViewItemModel,
    this.onSkip, required this.isVisible,
  });

  final  PageViewItemModel pageViewItemModel;
  final VoidCallback? onSkip;
  final bool isVisible ;


  @override
  Widget build(BuildContext context) {
    //print("Current locale: ${context.locale}");
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                /// Background
                Positioned.fill(
                  child: SvgPicture.asset(
                    pageViewItemModel.backgroundImage,
                    fit: BoxFit.fill,
                  ),
                ),
      

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(pageViewItemModel.image),
                ),
      
                /// Skip Button (localized)
                Visibility(
                  visible: isVisible,
                  child: Positioned(
                    top: 40,
                    right: context.locale.languageCode == 'ar' ? 16 : null,
                    left: context.locale.languageCode == 'ar' ? null : 16,
                    child: TextButton(
                      onPressed: onSkip,
                      child: Text(
                        'skip'.tr(),
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64,
          ),
          pageViewItemModel.title,
          SizedBox(
            height: 39.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37.0),
            child: Text(
              pageViewItemModel.subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
                color: Color(0xff4E5556),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../gen/assets.gen.dart';
//
// class PageViewItem extends StatelessWidget {
//   const PageViewItem({super.key, this.pageViewItemModel});
//   final pageViewItemModel;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         //
//         SizedBox(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height * 0.5,
//           child: Stack(
//             children: [
//               Positioned.fill(
//                 child: SvgPicture.asset(
//                   pageViewItemModel.backgroundImage,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: SvgPicture.asset(pageViewItemModel.image)),
//
//               const Text('تخط').tr(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
