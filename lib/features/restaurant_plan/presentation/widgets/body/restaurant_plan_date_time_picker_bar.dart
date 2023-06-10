
import 'package:flutter/material.dart';

import '../../../../../core/util/globals.dart';
import '../../../../reservation_picker/presentation/widgets/reservation_picker.dart';

class RestaurantPlanDateTimePickerBar extends StatelessWidget {
  const RestaurantPlanDateTimePickerBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding/4),
                child: ReservationPicker(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding/4),
                child: ReservationPicker(),
              ),
            )
          ],
        )
      ],
    );
  }
}
