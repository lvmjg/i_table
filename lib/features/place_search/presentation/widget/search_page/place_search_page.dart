import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/core/widget/common_page.dart';

import '../../bloc/place_search_bloc.dart';
import 'app_bar/place_search_app_bar.dart';
import 'body/place_search_body.dart';

class PlaceSearchPage extends StatefulWidget {
  const PlaceSearchPage({Key? key}) : super(key: key);

  @override
  State<PlaceSearchPage> createState() => _PlaceSearchPageState();
}

class _PlaceSearchPageState extends State<PlaceSearchPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      bloc: context.read<PlaceSearchBloc>(),
      child: Scaffold(
        appBar: PlaceSearchAppBar(title: ourPlaces),
        body: PlaceSearchBody(),
      ),
    );
  }


}
