
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/helper_functions/on_generate_routes.dart';

import 'core/services/shared_preferences_singleton.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_constants.dart';
import 'features/splash/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Prefs.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: AppConstants.translations,
      fallbackLocale: const Locale('ar'),
    //  saveLocale: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // REQUIRED for easy_localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,



      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,

      initialRoute: SplashView.routeName,
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor:  AppColors.PrimaryColor),
      ),


    );
  }
}
