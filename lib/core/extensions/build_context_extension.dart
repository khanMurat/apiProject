import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQueryData => MediaQuery.of(this);

  Size get size => mediaQueryData.size;

  double get height => size.height;

  double get width => size.width;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
