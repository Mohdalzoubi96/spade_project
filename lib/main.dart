import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'config/config.export.dart';
import 'features/feature.export.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'utils/common/common.export.dart';
import 'utils/services/custom_navigation.dart';
import 'utils/utils.export.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async{
//test comment
  runZonedGuarded<Future<void>>(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      Bloc.observer = AppBlocObserver();

      /// Initialize Firebase background handler messaging.
      await Firebase.initializeApp(name: 'main', options: DefaultFirebaseOptions.currentPlatform);

      final List<dynamic> setupFutures = await Future.wait([
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]),
        Firebase.initializeApp(),
        SharedPreferences.getInstance(),
      ]);

      HydratedBloc.storage = setupFutures[0];
      LocaleCubit.initial(SharedPreferenceService(setupFutures[2]).instance); // inits the service & localecubit
      await Future.delayed(const Duration(seconds: 1));
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));


      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ));
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);


      ///Submits a Crashlytics report of an error caught by the Flutter framework
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;


      runApp(const MyApp());
    },
        (error, stackTrace) {
      /// When an app crashes, record the stack trace in crashlytics.
      FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: false);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return listOfBlocProviders(
      Sizer(
        builder: (
          BuildContext context,
          Orientation orientation,
          DeviceType deviceType,
        ) {
          return MaterialApp(
            title: 'Spade',
            onGenerateRoute: CustomNavigator.onCreateRoute,
            navigatorKey: CustomNavigator.navigatorState,
            theme: LightTheme(context).theme,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            routes: appRoutes,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }

  Iterable<LocalizationsDelegate<dynamic>>? get localizationDelegates => const [
    AppLocalizations.delegate,
    FormBuilderLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  Iterable<Locale> get supportedLocales => const [
    Locale('en', 'US'),
    Locale('ar', 'SA'),
  ];
}
