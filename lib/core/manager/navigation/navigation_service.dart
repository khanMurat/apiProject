import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._init();

  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigateToPage(String path, {Object? data}) {
    navigatorKey.currentState!.pushNamed(
      path,
      arguments: data,
    );
  }

  void navigateToPageAndClear(String path, {Object? data}) {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      path,
      (route) => false,
      arguments: data,
    );
  }

  void navigateToBack({Object? data}) {
    navigatorKey.currentState!.pop(data);
  }
}
