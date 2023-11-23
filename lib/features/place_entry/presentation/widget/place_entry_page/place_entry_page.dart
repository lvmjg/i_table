import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/place_entry/presentation/bloc/place_entry_bloc.dart';

import '../../../../../core/widget/common_page.dart';
import 'app_bar/place_entry_app_bar.dart';
import 'body/place_entry_body.dart';

class PlaceEntryPage extends StatefulWidget {
  final String placeId;

  const PlaceEntryPage({Key? key, required this.placeId}) : super(key: key);

  @override
  State<PlaceEntryPage> createState() => _PlaceEntryPageState();
}

class _PlaceEntryPageState extends State<PlaceEntryPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      bloc: context.read<PlaceEntryBloc>(),
      child: Scaffold(
        appBar: PlaceEntryAppBar(title: reservationTerm),
        body: PlaceEntryBody(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context
        .read<PlaceEntryBloc>()
        .add(PlaceEntryInitiated(placeId: widget.placeId));
  }
}
