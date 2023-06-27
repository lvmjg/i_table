import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../reservation_picker/presentation/widgets/reservation_date_picker.dart';
import '../../../../../reservation_picker/presentation/widgets/reservation_time_picker.dart';

class PlacePanelDateTime extends StatelessWidget {
  const PlacePanelDateTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Data',
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
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Godzina',
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
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Czas',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 13)),

              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(200)),
                child: Center(
                  child: DropdownButton(
                    value: '1',
                    icon: Icon(Icons.arrow_drop_down_rounded, size: 30),
                    underline: Container(),
                    items: [
                      DropdownMenuItem<String>(
                          value: '1',
                          child: Text('1:00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black))),
                      DropdownMenuItem<String>(
                          value: '2',
                          child: Text('2:00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black))),
                    ],
                    onChanged: (Object? value) {},
                  ),
                ),
              )

            ],
          ),
        ),
      ],
    );
  }
}
