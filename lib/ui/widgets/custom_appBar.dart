import 'package:api_project/core/enums/appBar_enum.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final AppBarData appBarData;

  CustomAppBar(this.appBarData, {Key? key})
      : super(
          key: key,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          leading: Icon(appBarData.icon),
          title: Text(appBarData.title),
        );
}
