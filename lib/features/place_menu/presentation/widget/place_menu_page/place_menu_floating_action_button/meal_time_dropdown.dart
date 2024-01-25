import 'package:flutter/material.dart';
import 'package:i_table/core/extension/extension.dart';
import 'package:i_table/core/util/format_helper.dart';

import '../../../../../../core/util/globals.dart';

class MealTimeDropdown extends StatefulWidget {
  TimeOfDay initialTime;
  ValueChanged<TimeOfDay> onChanged;

  MealTimeDropdown({super.key, required this.initialTime, required this.onChanged});

  @override
  State<MealTimeDropdown> createState() => _MealTimeDropdownState();
}

class _MealTimeDropdownState extends State<MealTimeDropdown> {
  late TimeOfDay mealTime;
  late final TimeOfDay currentTime;
  late final TimeOfDay minTime;
  late final TimeOfDay maxTime;

  @override
  void initState() {
    super.initState();
    currentTime = widget.initialTime;
    minTime = TimeOfDay(hour: 0, minute: 0);
    maxTime = TimeOfDay(hour: 15, minute: 45);

    mealTime = currentTime;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<TimeOfDay>(
      value: mealTime,
      icon:
          Icon(Icons.arrow_drop_down_rounded, size: 30, color: Colors.black38),
      underline: Container(),
      items: _createDropDownItems(),
      onChanged: (TimeOfDay? newTime) {
        setState(() {
          mealTime = newTime ?? currentTime;
          widget.onChanged(mealTime);
        });
      },
    );
  }

  TimeOfDay _nearestQuarter(TimeOfDay val) {
    return TimeOfDay(
        hour: val.hour, minute: [0, 15, 30, 45, 60][(val.minute / 15).floor()]);
  }

  List<DropdownMenuItem<TimeOfDay>> _createDropDownItems() {
    List<TimeOfDay> acceptableTimes = [];
    acceptableTimes.add(minTime);
    
    while (acceptableTimes.last.isBefore(maxTime)) {
      TimeOfDay temp = acceptableTimes.last.add(Duration(minutes: 15));
      acceptableTimes.add(temp);
    }

    acceptableTimes.add(currentTime);

    acceptableTimes.sort((a, b) {
      Duration da = Duration(hours: a.hour, minutes: a.minute);
      Duration db = Duration(hours: b.hour, minutes: b.minute);
      if (da.inMinutes < db.inMinutes) {
        return -1;
      } else if (da.inMinutes > db.inMinutes) {
        return 1;
      } else {
        return 0;
      }
    });

    return acceptableTimes
        .map((time) => DropdownMenuItem<TimeOfDay>(
            value: time,
            child: Text(_displayTime(time),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold))))
        .toList();
  }

  String _displayTime(TimeOfDay time){
    if(time == currentTime){
      return FormatHelper.formatTime(time) + orderTimeNow;
    }

    return FormatHelper.formatTime(time);
  }
}
