
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helper_functions/on_generate_routes.dart';

import 'core/services/custom_bloc_observer.dart';
import 'core/services/git_it_service.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_constants.dart';
import 'features/splash/views/splash_view.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Prefs.init();
  setupGetIt();
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
