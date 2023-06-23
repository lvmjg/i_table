import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_table/features/reservation_entry/presentation/widgets/reservation_entry_appbar.dart';
import 'package:i_table/features/reservation_entry/presentation/widgets/reservation_entry_body.dart';
import 'package:i_table/features/search/domain/entity/search_entity.dart';
import '../../../../core/util/globals.dart';

class ReservationEntryPage extends StatefulWidget {
  final SearchEntity restaurant;

  const ReservationEntryPage({Key? key, required this.restaurant})
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
        body: ReservationEntryBody(restaurant: widget.restaurant),
      ),
    );
  }
}

