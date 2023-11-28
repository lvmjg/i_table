import 'package:flutter/material.dart';
import 'package:i_table/features/home/presentation/widget/home_page/bottom_navigation_bar/home_bottom_navigation_bar.dart';

import '../../../../../core/util/globals.dart';
import '../../../../../core/widget/common_page.dart';
import 'app_bar/home_app_bar.dart';
import 'body/home_body.dart';
import 'floating_action_button/home_floating_action_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      child: Scaffold(
        floatingActionButton: HomeFloatingActionButton(),
        appBar: HomeAppBar(title: appName),
        body: HomeBody(),
        bottomNavigationBar: HomeBottomNavigationBar(),
      ),
    );
  }
}
