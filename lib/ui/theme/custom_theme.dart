import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._init();

  static final CustomTheme _instance = CustomTheme._init();
  static CustomTheme get instance => _instance;

  ThemeData? themeData = ThemeData(
    scaffoldBackgroundColor: Colors.grey[300],
  );
}
