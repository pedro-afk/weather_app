import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/app/app_widget.dart';
import 'package:weatherapp/app/di/injections.dart';

Future<void> main() async {
  injections();
  await dotenv.load(fileName: '.env');
  runApp(const AppWidget());
}
