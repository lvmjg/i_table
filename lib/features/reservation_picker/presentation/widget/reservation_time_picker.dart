import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/extension/extension.dart';
import 'package:intl/intl.dart';

import '../../../../core/util/globals.dart';
import '../../../place_plan/presentation/bloc/place_bloc.dart';
import '../bloc/reservation_picker_bloc.dart';

class ReservationTimePicker extends StatefulWidget {
  const ReservationTimePicker({super.key});

  @override
  State<ReservationTimePicker> createState() => _ReservationTimePickerState();
}

class _ReservationTimePickerState extends State<ReservationTimePicker> {
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
                  onTap: () {
                    Future<TimeOfDay?> future = showTimePicker(
                      context: context,
                      initialTime: state.data.reservationDateTime.onlyTime(),
                    );
                    future.then((value) {
                      if (value != null) {
                        context.read<ReservationPickerBloc>().add(
                            ReservationPickerTimeSet(reservationTime: value));
                      }
                    });
                  },
                  child: Ink(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                      ),
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<ReservationPickerBloc>()
                                        .add(ReservationPickerTimeDecreased());
                                  },
                                  icon: Icon(Icons.arrow_left_rounded,
                                      size: 30, color: Colors.black38))),
                          Expanded(
                            flex: 1,
                            child: Text(
                              _formatTime(
                                  state.data.reservationDateTime.onlyTime()),
                              style: TextStyle(fontSize: 13),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<ReservationPickerBloc>()
                                        .add(ReservationPickerTimeIncreased());
                                  },
                                  icon: Icon(Icons.arrow_right_rounded,
                                      size: 30, color: Colors.black38))),
                        ],
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

  String _formatTime(TimeOfDay reservationTime) {
    return DateFormat.Hm().format(DateTime.now()
        .copyWith(hour: reservationTime.hour, minute: reservationTime.minute));
  }
}
