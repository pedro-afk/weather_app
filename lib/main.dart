import 'package:flutter/material.dart';
import 'package:weatherapp/app/app_widget.dart';
import 'package:weatherapp/app/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const AppWidget());
}
