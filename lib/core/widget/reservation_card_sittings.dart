import 'package:flutter/material.dart';
import 'package:i_table/core/widget/common_card.dart';

import '../../features/place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../util/globals.dart';

class ReservationCardSittings extends StatelessWidget {
  final PlaceReservation placeReservation;

  const ReservationCardSittings({Key? key, required this.placeReservation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        onPressed: () {},
        outerPadding: padding / 2,
        child: Column(
          children: [
            Text(chosenSittings,
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: padding),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(placeReservation.sittingsSummary,
                    style: Theme.of(context).textTheme.bodyMedium)),
          ],
        ));
  }
}
