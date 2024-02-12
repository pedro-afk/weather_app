import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.light,
    ),
    fontFamily: 'Poppins',
  );
}
