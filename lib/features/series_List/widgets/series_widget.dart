import 'package:api_project/core/extensions/build_context_extension.dart';
import 'package:api_project/features/series_List/series.dart';
import 'package:flutter/material.dart';

class SeriesWidget extends StatelessWidget {
  const SeriesWidget({
    Key? key,
    required this.onTap,
    required this.seriesModel,
  }) : super(key: key);

  final GestureTapCallback? onTap;

  final SeriesModel seriesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: Column(
              children: [
                Image.network(
                  seriesModel.imageURL!,
                ),
                const SizedBox(height: 2.5),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _SeriesInfo(
                        seriesModel: seriesModel,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SeriesInfo extends StatelessWidget {
  const _SeriesInfo({
    Key? key,
    required this.seriesModel,
  }) : super(key: key);

  final SeriesModel seriesModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Expanded(
            child: Text(
              seriesModel.name!,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
