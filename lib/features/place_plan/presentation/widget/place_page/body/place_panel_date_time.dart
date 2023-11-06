import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../reservation_picker/presentation/widget/reservation_date_picker.dart';
import '../../../../../reservation_picker/presentation/widget/reservation_duration_picker.dart';
import '../../../../../reservation_picker/presentation/widget/reservation_time_picker.dart';

class PlacePanelDateTime extends StatelessWidget {
  const PlacePanelDateTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding / 8),
                child: ReservationDatePicker(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(time,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 13)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding / 8),
                child: ReservationTimePicker(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(duration,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 13)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding / 8),
                child: ReservationDurationPicker(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
