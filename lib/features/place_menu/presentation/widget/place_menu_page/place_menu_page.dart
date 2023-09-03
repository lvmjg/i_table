import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/place_menu_bloc.dart';
import 'app_bar/place_menu_app_bar.dart';
import 'body/place_menu_body.dart';

class PlaceMenuPage extends StatefulWidget {
  final String placeId;

  const PlaceMenuPage({Key? key, required this.placeId}) : super(key: key);

  @override
  State<PlaceMenuPage> createState() => _PlaceMenuPageState();
}

class _PlaceMenuPageState extends State<PlaceMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: BlocBuilder<PlaceMenuBloc, PlaceMenuState>(
        builder: (context, state) {
          bool success = state is PlaceMenuFetchSuccess;
          int numberOfCategories = success ? state.placeMenu.placeMenuCategories.length : 0;
          return DefaultTabController(
            length: numberOfCategories,
            child: Scaffold(
              appBar: PlaceMenuAppBar(placeMenuCategories: success ? (state as PlaceMenuFetchSuccess).placeMenu.placeMenuCategories : []),
              body: PlaceMenuBody(),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context
        .read<PlaceMenuBloc>()
        .add(PlaceMenuInitiated(placeId: widget.placeId));
  }
}
