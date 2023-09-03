import 'package:flutter/material.dart';
import 'package:i_table/core/widget/reservation_card_empty.dart';

import '../util/globals.dart';

class ReservationCardSittings extends StatelessWidget {
  const ReservationCardSittings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReservationCardEmpty(
        child: Column(
          children: [
            Text('Wybrane miejsca', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: padding),
            Text('Stolik T1 -> Grupa 1 -> Miejsca S1, S2'
                'Stolik T2 -> Miejsca S5, S6'
            ),
          ],
        )
    );
  }
}
