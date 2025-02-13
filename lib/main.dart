import 'dart:async';
import 'package:alzabmarket/Helper/Language/Locale/LanguageController.dart';
import 'package:alzabmarket/Helper/Language/Words/Words.dart';
import 'package:alzabmarket/Helper/Log/LogApp.dart';
import 'package:alzabmarket/Helper/Service/onRunInit.dart';
import 'package:alzabmarket/View/Pages/SplashScreen/SplashScreen.dart';
import 'package:alzabmarket/View/route/Route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await OnRunInit.instance.initApp();

      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => LanguageController(),
            ),
          ],
          child: RootApp(),
        ),
      );
    },
    (
      error,
      stackTrace,
    ) {
      logError(" Error Main: $error == \n == $stackTrace ");
    },
  );
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageController>(
      builder: (context, value, child) {
        return MaterialApp(
          supportedLocales: value.supportLanguage,
          localeResolutionCallback: (locale, supportedLocales) {
            if (supportedLocales.contains(value.currentLocale)) {
              return locale;
            } else {
              return supportedLocales.first;
            }
          },
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          locale: value.currentLocale,
          title: Lang[Words.appName],
          initialRoute: '/',
          routes: RoutePage.instance.routes,
        );
      },
    );
  }
}
