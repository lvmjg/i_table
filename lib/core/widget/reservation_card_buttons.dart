import 'package:flutter/material.dart';
import 'package:i_table/core/widget/reservation_card_basic_details.dart';
import 'package:i_table/core/widget/reservation_card_sittings.dart';
import 'package:i_table/core/widget/simple_button.dart';

import '../../../../core/util/globals.dart';
import '../../../../core/widget/reservation_card_billing.dart';

class ReservationCardButtons extends StatelessWidget {
  const ReservationCardButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Wrap(
        spacing: padding/2,
        alignment: WrapAlignment.end,
        children: [
          SimpleButton(title: 'Anuluj', onPressed: (){}),
          SimpleButton(title: 'Potwiedź', onPressed: (){}),
          SimpleButton(title: 'Chat', onPressed: (){}),
          SimpleButton(title: 'Menu', onPressed: (){}),
          SimpleButton(title: 'Wezwij kelnera i zapłać', onPressed: (){})
        ],
      ),
    );
  }
}
