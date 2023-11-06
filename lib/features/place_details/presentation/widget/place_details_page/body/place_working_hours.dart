import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../domain/entity/place_details.dart';
import '../../../../domain/entity/place_details_opening_hours.dart';

class PlaceWorkingHours extends StatelessWidget {
  const PlaceWorkingHours({
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
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                label: Text(e),
              ),
            ))
        .toList();
  }
}
