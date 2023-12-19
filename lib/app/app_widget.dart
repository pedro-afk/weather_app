import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weatherapp/presenter/resources/app_strings.dart';
import 'package:weatherapp/presenter/resources/routes_manager.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('pt', 'BR'), Locale('en', '')],
      title: AppStrings.appTitle,
      initialRoute: Routes.home,
      onGenerateRoute: RoutesManager.getRoute,
    );
  }
}
