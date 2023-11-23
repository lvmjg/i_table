import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/util/globals.dart';
import '../../../../../core/widget/common_page.dart';
import '../../bloc/place_details_bloc.dart';
import 'app_bar/place_details_app_bar.dart';
import 'body/place_details_body.dart';

class PlaceDetailsPage extends StatefulWidget {
  final String placeId;
  final String placeName;

  const PlaceDetailsPage(
      {Key? key, required this.placeId, required this.placeName})
      : super(key: key);

  @override
  State<PlaceDetailsPage> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      bloc: context.read<PlaceDetailsBloc>(),
      child: Scaffold(
        appBar: PlaceDetailsAppBar(title: '$moreAbout ${widget.placeName}'),
        body: PlaceDetailsBody(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context
        .read<PlaceDetailsBloc>()
        .add(PlaceDetailsInitiated(placeId: widget.placeId));
  }
}
