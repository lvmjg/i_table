import 'dart:math';

import 'package:flutter/material.dart';
import 'package:i_table/core/extension/extension.dart';
import 'package:i_table/core/widget/reservation_card_buttons.dart';
import 'package:i_table/core/widget/common_card.dart';
import 'package:intl/intl.dart';

import '../../features/place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../util/globals.dart';

class ReservationCardBasicDetails extends StatelessWidget {
  final PlaceReservation placeReservation;
  final bool? buttonsEnabled;
  final VoidCallback? onPressed;

  const ReservationCardBasicDetails(
      {Key? key,
      required this.placeReservation,
      this.buttonsEnabled = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        onPressed: onPressed,
        outerPadding: EdgeInsets.all(padding / 8),
        innerPadding: EdgeInsets.all(padding / 3),
        child: Column(
          children: [
            Text('$reservation ${placeReservation.no.toUpperCase()}',
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: padding),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                placeReservation.placeName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(DateFormat('dd.MM.yyyy').format(placeReservation.startDate)),
            ]),
            SizedBox(height: padding),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(placeReservation.placeAddress),
              Text(placeReservation.timeRange),
            ]),
            SizedBox(height: padding),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RichText(
                text: TextSpan(
                    text: '$status ',
                    children: <InlineSpan>[
                      _customizeStatus(context, placeReservation.status, placeReservation.startDate)
                    ],
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              RichText(
                text: TextSpan(
                    text: '$numberOfPeople ',
                    children: <InlineSpan>[
                      TextSpan(
                          text: placeReservation.people.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium),
                    ],
                    style: Theme.of(context).textTheme.bodyMedium),
              )
            ]),
            SizedBox(height: (buttonsEnabled ?? false) ? padding : 0),
            showButtons()
          ],
        ));
  }

  Widget showButtons() {
    if (buttonsEnabled ?? false) {
      return ReservationCardButtons(placeReservation: placeReservation);
    }

    return Container();
  }

  _translateStatus(String status) {
    if (status == 'new') {
      return orderStatusNew;
    }  else if (status == 'active') {
      return orderStatusActive;
    } else if (status == 'closed') {
      return orderStatusClosed;
    } else if (status == 'cancelled') {
      return orderStatusCancelled;
    }
  }

  _setColorBasedOnStatus(String status) {
    if (status == 'new') {
      return Colors.black;
    }  else if (status == 'active') {
      return Colors.green;
    } else if (status == 'closed') {
      return Colors.red;
    } else if (status == 'cancelled') {
      return Colors.red;
    }
  }

  TextSpan _customizeStatus(BuildContext context, String status, DateTime startDate) {
    String adjustedStatus = status;

    if(status=='new' && startDate.isAfterOrEqual(DateTime.now())){
      adjustedStatus = 'active';
    }

    return TextSpan(
        text: _translateStatus(adjustedStatus),
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(
              color: _setColorBasedOnStatus(adjustedStatus)
            )
    );
  }
}
