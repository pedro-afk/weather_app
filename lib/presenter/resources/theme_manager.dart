import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue,
      brightness: Brightness.dark,
    ),
    fontFamily: 'Poppins',
  );
}
