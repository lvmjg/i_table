import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/reservation_picker/presentation/bloc/reservation_picker_bloc.dart';
import 'package:i_table/features/reservation_summary/presentation/widget/reservation_summary_page/reservation_summary_page.dart';

import '../../../../../core/util/globals.dart';
import '../../../../reservation_summary/presentation/bloc/reservation_summary_bloc.dart';
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
  Widget build(BuildContext context2) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PlaceAppBar(title: placePlan),
        body: PlaceBody()
      );
  }

  @override
  void initState() {
    super.initState();
    DateTime chosenDateAndTime = context.read<ReservationPickerBloc>().manager.reservationDateTime;
    Duration chosenDuration = context.read<ReservationPickerBloc>().manager.reservationDuration;
    context.read<PlaceBloc>().add(PlaceInitiated(placeId: widget.placeId, reservationDateTime: chosenDateAndTime, reservationDuration: chosenDuration));
  }
}





