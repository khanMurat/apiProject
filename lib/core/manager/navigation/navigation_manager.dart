import 'package:api_project/core/manager/navigation/navigation_constants.dart';
import 'package:api_project/features/detail/detail_view.dart';
import 'package:api_project/features/home/home_view.dart';
import 'package:api_project/features/liked/liked_view.dart';
import 'package:api_project/features/series_List/series.dart';
import 'package:api_project/features/series_List/series_list_view.dart';
import 'package:api_project/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

class NavigationManager {
  NavigationManager._init();

  static final NavigationManager _instance = NavigationManager._init();
  static NavigationManager get instance => _instance;

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.splash:
        return navigate(NavigationConstants.splash, SplashView());
      case NavigationConstants.home:
        return navigate(NavigationConstants.home, HomeView());
      case NavigationConstants.detail:
        return navigate(
            NavigationConstants.detail,
            DetailView(
              seriesModel: settings.arguments as SeriesModel,
            ));
      case NavigationConstants.liked:
        return navigate(NavigationConstants.liked, LikedView());
      case NavigationConstants.series:
        return navigate(NavigationConstants.series, SeriesView());
      default:
        return navigate(NavigationConstants.home, HomeView());
    }
  }

  MaterialPageRoute navigate(String path, Widget view, {Object? data}) {
    return MaterialPageRoute(
      builder: (context) => view,
      settings: RouteSettings(name: path, arguments: data),
    );
  }
}
