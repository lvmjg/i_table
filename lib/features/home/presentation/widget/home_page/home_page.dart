import 'package:flutter/material.dart';

import '../../../../../core/util/globals.dart';
import '../../../../../core/widget/common_page.dart';
import 'app_bar/home_app_bar.dart';
import 'body/home_body.dart';
import 'floating_action_button/home_floating_action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      child: Scaffold(
        floatingActionButton: HomeFloatingActionButton(),
        appBar: HomeAppBar(title: appName),
        body: HomeBody(),
      ),
    );
  }
}
