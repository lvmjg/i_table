import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/globals.dart';
import '../../bloc/place_search_bloc.dart';
import 'app_bar/place_search_app_bar.dart';
import 'body/place_search_body.dart';
import 'drawer/place_search_drawer.dart';

class PlaceSearchPage extends StatefulWidget {
  const PlaceSearchPage({Key? key}) : super(key: key);

  @override
  State<PlaceSearchPage> createState() => _PlaceSearchPageState();
}

class _PlaceSearchPageState extends State<PlaceSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(primary),
      appBar: PlaceSearchAppBar(),
      body: PlaceSearchBody(),
      drawer: PlaceSearchDrawer(),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<PlaceSearchBloc>().add(PlaceSearchInitiated());
  }
}
