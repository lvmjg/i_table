import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/place_bloc.dart';
import 'appbar/place_app_bar.dart';
import 'body/place_body.dart';

class PlacePage extends StatefulWidget {
  final String placeId;

  const PlacePage({Key? key, required this.placeId}) : super(key: key);

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PlaceAppBar(),
      body: PlaceBody(placeId: widget.placeId)
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<PlaceBloc>().add(PlaceInitiated(
        placeId: widget.placeId, reservationTime: DateTime.now()));
  }
}





