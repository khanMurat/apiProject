import 'package:api_project/core/manager/navigation/navigation_manager.dart';
import 'package:api_project/core/manager/navigation/navigation_service.dart';
import 'package:api_project/features/home/home_view.dart';
import 'package:api_project/features/series_List/series_list_view_model.dart';
import 'package:api_project/ui/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _instance = SeriesListViewModel.instance;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _instance,
      child: MaterialApp(
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: NavigationManager.instance.generateRoute,
        theme: CustomTheme.instance.themeData,
        home: HomeView(),
      ),
    );
  }
}
