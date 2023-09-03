import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/util/hex_color.dart';
import '../../../../domain/entities/place_details.dart';
import '../../../../domain/entities/place_details_opening_hours.dart';


class PlaceOpeningHours extends StatelessWidget {
  const PlaceOpeningHours({
    super.key,
    required this.placeDetails,
  });

  final PlaceDetails placeDetails;

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
      PlaceDetailsOpeningHours placeOpeningHours) {
    List<String> workDays = [];
    workDays.add(
        'Pn ${placeOpeningHours.monday}');
    workDays.add(
        'Wt ${placeOpeningHours.tuesday}');
    workDays.add(
        'Śr ${placeOpeningHours.wednesday}');
    workDays.add(
        'Czw ${placeOpeningHours.thursday}');
    workDays.add(
        'Pt ${placeOpeningHours.friday}');
    workDays.add(
        'Sb ${placeOpeningHours.saturday}');
    workDays.add(
        'Nd ${placeOpeningHours.sunday}');

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
