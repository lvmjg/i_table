import 'package:flutter/material.dart';
import 'package:i_table/core/widget/reservation_card_buttons.dart';
import 'package:i_table/core/widget/reservation_card_empty.dart';

import '../util/globals.dart';

class ReservationCardBasicDetails extends StatelessWidget {
  const ReservationCardBasicDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReservationCardEmpty(
        child: Column(
          children: [
            Text('Rezerwacja', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: padding/2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nr 1111'),
                Text('23.05.2023'),
              ]

            ),
            SizedBox(height: padding/2),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('147 Break'),
                  Text('17:00 - 22:00'),
                ]

            ),
            SizedBox(height: padding/2),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Status Nowa'),
                  Text('Liczba osób 4'),
                ]

            ),
            SizedBox(height: padding/2),
            ReservationCardButtons()
          ],
        )
    );
  }
}
