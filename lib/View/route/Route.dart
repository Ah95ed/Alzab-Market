import 'package:alzabmarket/View/Pages/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';

class RoutePage {
  RoutePage._();
  static final RoutePage instance = RoutePage._();
  static String initRoute = '/';
  Map<String, Widget Function(BuildContext)> routes = {
    initRoute: (context) => SplashScreen(),
  };
}
