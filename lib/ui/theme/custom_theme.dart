import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._init();

  static final CustomTheme _instance = CustomTheme._init();
  static CustomTheme get instance => _instance;

  ThemeData? themeData = ThemeData(
      scaffoldBackgroundColor: Colors.grey[300],
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white70,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.black,
      ));

  ThemeData? darkThemeData = ThemeData(
      scaffoldBackgroundColor: Colors.grey[800],
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blueGrey));
}
