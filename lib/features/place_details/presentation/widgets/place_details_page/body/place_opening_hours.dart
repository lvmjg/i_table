import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/util/hex_color.dart';
import '../../../../domain/entity/place_details_entity.dart';
import '../../../../domain/entity/place_details_opening_hours_entity.dart';

class PlaceOpeningHours extends StatelessWidget {
  const PlaceOpeningHours({
    super.key,
    required this.placeDetails,
  });

  final PlaceDetailsEntity placeDetails;

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
                  getOpeningHours(placeDetails.placeOpeningHours)),
        ),
      ],
    );
  }

  List<Widget> getOpeningHours(
      PlaceDetailsOpeningHoursEntity placeOpeningHours) {
    List<String> workDays = [];
    workDays.add(
        'Pn ${placeOpeningHours.monday.open}-${placeOpeningHours.monday.close}');
    workDays.add(
        'Wt ${placeOpeningHours.tuesday.open}-${placeOpeningHours.tuesday.close}');
    workDays.add(
        'Śr ${placeOpeningHours.wednesday.open}-${placeOpeningHours.wednesday.close}');
    workDays.add(
        'Czw ${placeOpeningHours.thursday.open}-${placeOpeningHours.thursday.close}');
    workDays.add(
        'Pt ${placeOpeningHours.friday.open}-${placeOpeningHours.friday.close}');
    workDays.add(
        'Sb ${placeOpeningHours.saturday.open}-${placeOpeningHours.saturday.close}');
    workDays.add(
        'Nd ${placeOpeningHours.sunday.open}-${placeOpeningHours.sunday.close}');

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
