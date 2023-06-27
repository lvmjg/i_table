import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/util/globals.dart';
import '../../../../place_search/domain/entities/place_search_entity.dart';
import 'app_bar/reservation_entry_app_bar.dart';
import 'body/reservation_entry_body.dart';

class ReservationEntryPage extends StatefulWidget {
  final PlaceSearchEntity place;

  const ReservationEntryPage({Key? key, required this.place})
      : super(key: key);

  @override
  State<ReservationEntryPage> createState() => _ReservationEntryPageState();
}

class _ReservationEntryPageState extends State<ReservationEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(primary),
      child: Scaffold(
        backgroundColor: Color(primary),
        appBar: ReservationEntryAppBar(),
        body: ReservationEntryBody(place: widget.place),
      ),
    );
  }
}

