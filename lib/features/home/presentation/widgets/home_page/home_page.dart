import 'package:flutter/material.dart';
import 'package:i_table/features/home/presentation/widgets/home_page/app_bar/home_app_bar.dart';

import 'body/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: HomeBody(),
    );
  }
}

