import 'package:flutter/material.dart';

import '../../../../../core/util/globals.dart';
import '../../../../../core/util/hex_color.dart';
import '../../../domain/entity/restaurant_details_entity.dart';
import '../../../domain/entity/restaurant_opening_hours_entity.dart';

class RestaurantOpeningHours extends StatelessWidget {
  const RestaurantOpeningHours({
    super.key,
    required this.restaurantDetails,
  });

  final RestaurantDetailsEntity restaurantDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          openingHours,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: padding,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(padding, 0, padding, padding),
          child: Wrap(
              alignment: WrapAlignment.center,
              children:
                  getOpeningHours(restaurantDetails.restaurantOpeningHours)),
        ),
      ],
    );
  }

  List<Widget> getOpeningHours(
      RestaurantOpeningHoursEntity restaurantOpeningHours) {
    List<String> workDays = [];
    workDays.add(
        'Pn ${restaurantOpeningHours.monday.open}-${restaurantOpeningHours.monday.close}');
    workDays.add(
        'Wt ${restaurantOpeningHours.tuesday.open}-${restaurantOpeningHours.tuesday.close}');
    workDays.add(
        'Śr ${restaurantOpeningHours.wednesday.open}-${restaurantOpeningHours.wednesday.close}');
    workDays.add(
        'Czw ${restaurantOpeningHours.thursday.open}-${restaurantOpeningHours.thursday.close}');
    workDays.add(
        'Pt ${restaurantOpeningHours.friday.open}-${restaurantOpeningHours.friday.close}');
    workDays.add(
        'Sb ${restaurantOpeningHours.saturday.open}-${restaurantOpeningHours.saturday.close}');
    workDays.add(
        'Nd ${restaurantOpeningHours.sunday.open}-${restaurantOpeningHours.sunday.close}');

    return workDays
        .map((e) => Padding(
              padding: EdgeInsets.all(2),
              child: Chip(
                label: Text(e),
                backgroundColor: HexColor("#f2f2f2"),
              ),
            ))
        .toList();
  }
}
