import 'package:flutter/material.dart';
import 'package:i_table/core/widget/common_card.dart';

import '../util/globals.dart';

class ReservationCardBilling extends StatelessWidget {
  const ReservationCardBilling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        onPressed: () {  },
        outerPadding: padding/2,
        child: Column(
          children: [
            Text(settlement, style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: padding),
            RichText(
              text: TextSpan(
                  text: 'Wartość zamówienia ',
                  children: <InlineSpan>[
                    TextSpan(
                        text: '134 zł',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            SizedBox(height: padding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Opłacono ',
                      children: <InlineSpan>[
                        TextSpan(
                            text: '74 zł',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.green))
                      ],
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Pozostało ',
                      children: <InlineSpan>[
                        TextSpan(
                            text: '60 zł',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.red))
                      ],
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
            )

          ],
        )
    );
  }
}