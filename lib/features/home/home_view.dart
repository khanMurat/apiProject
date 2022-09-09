import 'package:api_project/core/enums/appBar_enum.dart';
import 'package:api_project/features/liked/liked_view.dart';
import 'package:api_project/features/series_List/series_list_view.dart';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(AppBarData.series.icon),
              label: AppBarData.series.title),
          BottomNavigationBarItem(
              icon: Icon(AppBarData.liked.icon), label: AppBarData.liked.title),
        ],
      ),
      body: _buildBody(_selectedIndex),
    );
  }

  Widget _buildBody(int index) {
    switch (_selectedIndex) {
      case 0:
        return SeriesView();
      case 1:
        return LikedView();
      default:
        return HomeView();
    }
  }
}
