import 'package:flutter/material.dart';
import 'package:i_table/core/widget/reservation_card_empty.dart';

import '../util/globals.dart';

class ReservationCardBilling extends StatelessWidget {
  const ReservationCardBilling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReservationCardEmpty(
        child: Column(
          children: [
            Text('Rozliczenie', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: padding),
            Text('Wartość zamówienia 134 zł'),
            SizedBox(height: padding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Opłacono 74 zł'),
                Text('Pozostało 60 zł'),
              ],
            )

          ],
        )
    );
  }
}