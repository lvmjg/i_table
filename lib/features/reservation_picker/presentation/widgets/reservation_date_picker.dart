import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/util/globals.dart';
import '../../../restaurant_plan/presentation/bloc/restaurant_plan_bloc.dart';
import '../../../search/presentation/bloc/search_bloc.dart';

class ReservationDatePicker extends StatefulWidget {
  const ReservationDatePicker({super.key});

  @override
  State<ReservationDatePicker> createState() => _ReservationDatePickerState();
}

class _ReservationDatePickerState extends State<ReservationDatePicker> {
  final TextEditingController controller = new TextEditingController();

  late DateTime reservationDate;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(primary),
      child: Padding(
          padding: EdgeInsets.all(padding / 4),
          child: InkWell(
            onTap: () {
              Future<DateTime?> future = showDatePicker(
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
                  initialDate: reservationDate,
                  firstDate: reservationDate,
                  lastDate: reservationDate.add(const Duration(days: 30)));
              future.then((value) {
                if (value != null) {
                  setState(() {
                    reservationDate = value;
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
                                reservationDate = reservationDate.subtract(Duration(days: 1));
                                context.read<RestaurantPlanBloc>().add(RestaurantPlanReservationDateChanged(reservationDate: reservationDate));
                              });
                            },
                            icon: Icon(Icons.arrow_left_rounded, size: 30))),
                    Expanded(
                      flex: 1,
                      child: Text(
                        _formatDate(reservationDate),
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                reservationDate = reservationDate.add(Duration(days: 1));
                                context.read<RestaurantPlanBloc>().add(RestaurantPlanReservationDateChanged(reservationDate: reservationDate));
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
    reservationDate = DateTime.now();
  }

  String _formatDate(DateTime reservationDate){
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.write(DateFormat.Md().format(reservationDate));
    stringBuffer.write('\n');
    stringBuffer.write('Pn ' + DateFormat.y().format(reservationDate));
    return stringBuffer.toString();
  }
}
