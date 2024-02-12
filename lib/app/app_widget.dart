import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weatherapp/presenter/resources/app_strings.dart';
import 'package:weatherapp/presenter/resources/routes_manager.dart';
import 'package:weatherapp/presenter/resources/theme_manager.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: getApplicationTheme(),
      supportedLocales: const [Locale('pt', 'BR'), Locale('en', '')],
      title: AppStrings.appTitle,
      initialRoute: Routes.home,
      onGenerateRoute: RoutesManager.getRoute,
    );
  }
}
