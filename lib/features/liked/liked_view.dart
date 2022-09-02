import 'package:api_project/core/enums/appBar_enum.dart';
import 'package:api_project/ui/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LikedView extends StatelessWidget {
  const LikedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(AppBarData.liked),
      body:
          Center(child: Text('This page illustrates that Tv-Series you liked')),
    );
  }
}
