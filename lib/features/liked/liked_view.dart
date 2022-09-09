import 'package:api_project/core/enums/appBar_enum.dart';
import 'package:api_project/features/liked/liked_view_model.dart';
import 'package:api_project/features/liked/liked_view_notifier.dart';
import 'package:api_project/ui/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LikedView extends StatelessWidget {
  const LikedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(AppBarData.liked, context),
      body: Consumer<LikedViewNotifier>(
        builder: ((context, value, child) {
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 50,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10,
            children: [
              for (var likedSeries in value.likedSeries)
                LikedWidget(seriesModel: likedSeries),
            ],
          );
        }),
      ),
    );
  }
}
