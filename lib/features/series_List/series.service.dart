import 'dart:developer';

import 'package:api_project/core/manager/network/network.dart';
import 'package:api_project/features/series_List/series.dart';

class SeriesModelList {
  SeriesModelList._init();

  static final SeriesModelList _instance = SeriesModelList._init();
  static SeriesModelList get instance => _instance;

  final _network = Network.instance;

  Future<List<SeriesModel>> getSeriesList() async {
    try {
      final data = await _network.getData();

      final list = List<Map<String, dynamic>>.from(data);

      final serviceList = list.map((e) => SeriesModel.fromMap(e)).toList();

      return serviceList;
    } on Exception {
      rethrow;
    }
  }
}
