import 'package:api_project/features/liked/liked_view_model.dart';
import 'package:api_project/features/series_List/series.dart';
import 'package:flutter/material.dart';

class LikedViewNotifier extends ChangeNotifier {
  List<SeriesModel> likedSeries = [];

  void addLiked(SeriesModel widget) {
    likedSeries.add(widget);
    notifyListeners();
  }

  void unLiked(SeriesModel widget) {
    likedSeries.remove(widget);
    notifyListeners();
  }
}
