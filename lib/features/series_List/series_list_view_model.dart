import 'package:api_project/features/series_List/series.dart';
import 'package:api_project/features/series_List/series.service.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SeriesListViewModel extends ChangeNotifier {
  SeriesListViewModel._init();

  static final SeriesListViewModel _instance = SeriesListViewModel._init();
  static SeriesListViewModel get instance => _instance;

  List<SeriesModel> tvList = [];

  bool loading = false;

  Future<void> getSeriesList() async {
    try {
      tvList = await SeriesModelList.instance.getSeriesList();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
