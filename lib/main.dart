import 'package:api_project/core/manager/navigation/navigation_manager.dart';
import 'package:api_project/core/manager/navigation/navigation_service.dart';
import 'package:api_project/features/home/home_view.dart';
import 'package:api_project/features/liked/liked_view.dart';
import 'package:api_project/features/liked/liked_view_notifier.dart';
import 'package:api_project/features/series_List/series_list_view_model.dart';
import 'package:api_project/features/splash/splash_view.dart';
import 'package:api_project/features/splash/splash_view_model.dart';
import 'package:api_project/ui/theme/custom_theme.dart';
import 'package:api_project/ui/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SeriesListViewModel>(
          create: (_) => SeriesListViewModel.instance,
        ),
        ChangeNotifierProvider<LikedViewNotifier>(
            create: (_) => LikedViewNotifier()),
        ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider<SplashViewModel>(
            create: (_) => SplashViewModel.instance)
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.instance.navigatorKey,
          onGenerateRoute: NavigationManager.instance.generateRoute,
          theme: Provider.of<ThemeNotifier>(context).theme,
          home: SplashView(),
        );
      },
    );
  }
}
