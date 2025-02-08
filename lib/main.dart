import 'dart:async';
import 'package:alzabmarket/Helper/Log/LogApp.dart';
import 'package:alzabmarket/Helper/Service/onRunInit.dart';
import 'package:alzabmarket/View/route/Route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await runZonedGuarded<Future<void>>(
    () async {
      await OnRunInit.instance.initApp();
      runApp(
        RootApp(),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        fontFamily: 'Cairo',
        primarySwatch: Colors.blue,
      ),
      title: "سوق الزاب",
      home: const SplashScreen(),
      routes: RoutePage.instance.routes,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
