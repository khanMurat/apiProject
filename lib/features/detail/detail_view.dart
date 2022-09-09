import 'package:api_project/core/extensions/build_context_extension.dart';
import 'package:api_project/core/manager/navigation/navigation_service.dart';
import 'package:api_project/features/liked/liked_view_notifier.dart';
import 'package:api_project/features/series_List/series.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.seriesModel,
  }) : super(key: key);

  final SeriesModel seriesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          _likedAndBackButtons(context),
          _seriesImageWidget(),
          Expanded(
            child: customContainer(context),
          )
        ],
      ),
    );
  }

  Padding _likedAndBackButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              NavigationService.instance.navigateToBack();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              Provider.of<LikedViewNotifier>(context, listen: false)
                  .addLiked(seriesModel);
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Center _seriesImageWidget() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Image.network(
          seriesModel.imageURL!,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Container customContainer(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: _seriesDetailColumn(context),
    );
  }

  Column _seriesDetailColumn(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text(
        (' Platform: ${seriesModel.network!}'),
        style: context.textTheme.titleLarge,
      ),
      Text(
        ('Country : ${seriesModel.country}'),
        style: context.textTheme.bodyMedium,
      ),
      Text(
        seriesModel.name!,
        style: context.textTheme.titleMedium,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Start Date : ${seriesModel.startDate!}',
            style: context.textTheme.labelMedium,
          ),
          Text('Status : ${seriesModel.status!}'),
        ],
      ),
      _watchButton()
    ]);
  }

  Padding _watchButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.black),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Watch'),
          ],
        ),
      ),
    );
  }
}
