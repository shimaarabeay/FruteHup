
import 'package:device_preview/device_preview.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_app/features/auth/presentation/views/widgets/custom_bloc_observer.dart';
import 'package:prefs/prefs.dart';
import 'core/helper_functions.dart';
import 'core/services/git_it_services.dart';
import 'core/services/shared_preferences/shared_preferences_singleton.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  await SharedPreferencesSingleton.init();
  await Prefs.init();
  Bloc.observer= CustomBlocObserver();
  setupGetIt();
  runApp(
      //FruitApp()
    DevicePreview(
      enabled: true,
      builder: (context) {
        return const FruitApp();
      }, // Wrap app
    ),
  );
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
