import 'package:flutter/material.dart';
import 'package:weatherapp/presenter/home/home_page.dart';
import 'package:weatherapp/presenter/resources/app_strings.dart';

abstract class Routes {
  static const String splash = '/splash';
  static const String home = '/home';
}

abstract class RoutesManager {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.undefinedRoute),
        ),
      ),
    );
  }
}
