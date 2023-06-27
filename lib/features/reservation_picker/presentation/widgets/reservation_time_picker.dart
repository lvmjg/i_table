import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/util/globals.dart';
import '../../../place/presentation/bloc/place_bloc.dart';

class ReservationTimePicker extends StatefulWidget {
  const ReservationTimePicker({super.key});

  @override
  State<ReservationTimePicker> createState() => _ReservationTimePickerState();
}

class _ReservationTimePickerState extends State<ReservationTimePicker> {
  final TextEditingController controller = new TextEditingController();

  late TimeOfDay reservationTime;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
          padding: EdgeInsets.all(padding / 4),
          child: InkWell(
            onTap: () {
              Future<TimeOfDay?> future = showTimePicker(
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Color(primary), // header background color
                          onPrimary: Colors.white, // header text color
                          onSurface: Colors.black, // body text color
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red, // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                  context: context,
                  initialTime: reservationTime
              );
              future.then((value) {
                if (value != null) {
                  setState(() {
                    reservationTime = value;
                  });
                }
              });
            },
            child: Ink(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(200)),
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                reservationTime = reservationTime.replacing(hour: reservationTime.hour - 1);
                                context.read<PlaceBloc>().add(PlaceReservationTimeChanged(reservationTime: reservationTime));
                              });
                            },
                            icon: Icon(Icons.arrow_left_rounded, size: 30))),
                    Expanded(
                      flex: 1,
                      child: Text(
                        _formatTime(reservationTime),
                        style: TextStyle(fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                reservationTime = reservationTime.replacing(hour: reservationTime.hour + 1);
                                context.read<PlaceBloc>().add(PlaceReservationTimeChanged(reservationTime: reservationTime));
                              });
                            },
                            icon: Icon(
                              Icons.arrow_right_rounded,
                              size: 30,
                            )))
                  ],
                ),
              ),
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    reservationTime = TimeOfDay.now();
  }

  String _formatTime(TimeOfDay reservationTime){
    return DateFormat.Hm().format(DateTime.now().copyWith(hour: reservationTime.hour, minute: reservationTime.minute));
  }
}
