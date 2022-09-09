import 'package:api_project/core/enums/appBar_enum.dart';
import 'package:api_project/ui/theme/custom_theme.dart';
import 'package:api_project/ui/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends AppBar {
  final AppBarData appBarData;
  final BuildContext context;

  CustomAppBar(this.appBarData, this.context, {Key? key})
      : super(
          key: key,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          leading: Icon(appBarData.icon),
          title: Text(appBarData.title),
          actions: [
            Consumer<ThemeNotifier>(
              builder: ((context, theme, child) {
                return IconButton(
                  onPressed: () {
                    theme.changeTheme();
                  },
                  icon: theme.theme == CustomTheme.instance.darkThemeData
                      ? const Icon(Icons.light_mode)
                      : const Icon(Icons.dark_mode),
                );
              }),
            ),
          ],
        );
}
