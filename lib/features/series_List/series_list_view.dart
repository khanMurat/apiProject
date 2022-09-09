import 'package:api_project/core/enums/appBar_enum.dart';
import 'package:api_project/core/extensions/build_context_extension.dart';
import 'package:api_project/core/manager/navigation/navigation_constants.dart';
import 'package:api_project/core/manager/navigation/navigation_service.dart';
import 'package:api_project/features/series_List/series_list_view_model.dart';
import 'package:api_project/features/series_List/widgets/series_widget.dart';
import 'package:api_project/ui/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeriesView extends StatefulWidget {
  const SeriesView({Key? key}) : super(key: key);

  @override
  State<SeriesView> createState() => _SeriesViewState();
}

class _SeriesViewState extends State<SeriesView> {
  final _seriesListModel = SeriesListViewModel.instance;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SeriesListViewModel>(context, listen: false).getSeriesList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(AppBarData.series, context),
      body: Provider.of<SeriesListViewModel>(context).loading
          ? const Center(child: CircularProgressIndicator())
          : GridView.count(
              childAspectRatio: 0.6,
              mainAxisSpacing: context.height * 0.050,
              crossAxisSpacing: context.width * 0.01,
              crossAxisCount: 2,
              children: [
                for (var series
                    in Provider.of<SeriesListViewModel>(context).tvList)
                  SeriesWidget(
                      onTap: () {
                        NavigationService.instance.navigateToPage(
                            NavigationConstants.detail,
                            data: series);
                      },
                      seriesModel: series)
              ],
            ),
    );
  }
}
