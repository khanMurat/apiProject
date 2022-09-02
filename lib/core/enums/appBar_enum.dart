import 'package:flutter/material.dart';

enum AppBarData {
  series('TV-Series', (Icons.list)),
  liked('Your Favourite', Icons.favorite),
  detail('Detail View', Icons.details);

  final String title;
  final IconData icon;

  const AppBarData(
    this.title,
    this.icon,
  );
}
