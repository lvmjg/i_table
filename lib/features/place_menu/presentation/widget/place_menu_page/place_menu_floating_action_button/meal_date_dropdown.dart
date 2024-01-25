import 'package:flutter/material.dart';
import 'package:i_table/core/extension/extension.dart';

import '../../../../../../core/util/globals.dart';

class MealDateDropdown extends StatefulWidget {
  DateTime initialDate;
  ValueChanged<DateTime> onChanged;

  MealDateDropdown({super.key, required this.initialDate, required this.onChanged});

  @override
  State<MealDateDropdown> createState() => _MealDateDropdownState();
}

class _MealDateDropdownState extends State<MealDateDropdown> {

  late DateTime mealDate;
  late final DateTime todayDate;
  late final DateTime tomorrowDate;

  @override
  void initState() {
    super.initState();
    todayDate = widget.initialDate;
    tomorrowDate = todayDate.add(Duration(days: 1));

    mealDate = todayDate;
  }

  @override
  Widget build(BuildContext context) {
    return   DropdownButton<DateTime>(
      value: mealDate,
      icon: Icon(Icons.arrow_drop_down_rounded,
          size: 30, color: Colors.black38),
      underline: Container(),
      items: [
        DropdownMenuItem(
          value: todayDate,
          child:  Text(orderToday,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
        DropdownMenuItem(
          value: tomorrowDate
          , child: Text(orderTomorrow,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.bold)),
        )
      ],
      onChanged: (DateTime? newDate) {
        setState(() {
          mealDate = newDate ?? todayDate;
          widget.onChanged(mealDate);
        });
      },
    );
  }
}
