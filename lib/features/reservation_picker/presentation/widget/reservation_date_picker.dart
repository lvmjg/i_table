import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/util/globals.dart';
import '../../../place_plan/presentation/bloc/place_bloc.dart';
import '../bloc/reservation_picker_bloc.dart';

class ReservationDatePicker extends StatefulWidget {
  final int reservationDaysAhead = 0;

  const ReservationDatePicker({super.key});

  @override
  State<ReservationDatePicker> createState() => _ReservationDatePickerState();
}

class _ReservationDatePickerState extends State<ReservationDatePicker> {
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
                    Future<DateTime?> future = showDatePicker(
                        context: context,
                        firstDate: state.data.firstDate,
                        initialDate: state.data.reservationDateTime,
                        lastDate: state.data.lastDate);
                    future.then((value) {
                      if (value != null) {
                        context.read<ReservationPickerBloc>().add(
                            ReservationPickerDateSet(reservationDate: value));
                      }
                    });
                  },
                  child: Ink(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(200)
                       ),
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
                                        .add(ReservationPickerDateDecreased());
                                  },
                                  icon: Icon(Icons.arrow_left_rounded,
                                      size: 30, color: Colors.black38))),
                          Expanded(
                            flex: 1,
                            child: Text(
                              _formatDate(state.data.reservationDateTime),
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
                                        .add(ReservationPickerDateIncreased());
                                  },
                                  icon: Icon(
                                    Icons.arrow_right_rounded,
                                    size: 30, color: Colors.black38))),
                        ],
                      ),
                    ),
                  ),
                )),
          );
        }
        return SizedBox(
            child: Center(
                child: CircularProgressIndicator(color: primaryColor)));
      },
    );
  }

  String _formatDate(DateTime reservationDate) {
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.write(DateFormat.Md().format(reservationDate));
    stringBuffer.write('\n');
    stringBuffer.write("${_getWeekdayShortName(reservationDate.weekday)} ${DateFormat.y().format(reservationDate)}");
    return stringBuffer.toString();
  }

  String _getWeekdayShortName(int weekday){
    if(weekday==1){
      return "Pn";
    }
    else if(weekday==2){
      return "Wt";
    }
    else if(weekday==3){
      return "Śr";
    }
    else if(weekday==4){
      return "Czw";
    }
    else if(weekday==5){
      return "Pt";
    }
    else if(weekday==6){
      return "Sb";
    }
    else if(weekday==7){
      return "Nd";
    }
    else{
      return "Pn";
    }
  }
}
