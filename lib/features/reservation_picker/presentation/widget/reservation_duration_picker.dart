import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/util/globals.dart';
import '../../../place_plan/presentation/bloc/place_bloc.dart';
import '../bloc/reservation_picker_bloc.dart';

class ReservationDurationPicker extends StatefulWidget {
  final int reservationDaysAhead = 0;

  const ReservationDurationPicker({super.key});

  @override
  State<ReservationDurationPicker> createState() =>
      _ReservationDurationPickerState();
}

class _ReservationDurationPickerState extends State<ReservationDurationPicker> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationPickerBloc, ReservationPickerState>(
      builder: (context, state) {
        if (state is ReservationPickerChange) {
          return Material(
            color: Colors.transparent,
            child: Padding(
                padding: EdgeInsets.all(padding / 4),
                child: InkWell(
                  onTap: () {},
                  child: Ink(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                      ),
                      height: 50,
                      child: Center(
                        child: DropdownButton(
                          value: state.data.reservationDuration,
                          icon: Icon(Icons.arrow_drop_down_rounded,
                              size: 30, color: Colors.black38),
                          underline: Container(),
                          items: createDropDownItems(
                              state.data.acceptableDurations),
                          onChanged: (Object? value) {
                            Duration newDuration = value as Duration;
                            context.read<ReservationPickerBloc>().add(
                                ReservationPickerDurationSet(
                                    reservationDuration: newDuration));
                          },
                        ),
                      ),
                    ),
                  ),
                )),
          );
        }
        return SizedBox(
            child:
                Center(child: CircularProgressIndicator(color: primaryColor)));
      },
    );
  }

  List<DropdownMenuItem<Duration>> createDropDownItems(
      List<Duration> acceptableDurations) {
    return acceptableDurations
        .map((duration) => DropdownMenuItem<Duration>(
            value: duration,
            child: Text('${duration.inHours}h ${duration.inMinutes % 60}min',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black))))
        .toList();
  }
}
