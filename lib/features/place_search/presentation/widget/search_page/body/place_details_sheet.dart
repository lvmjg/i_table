import 'package:flutter/material.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/core/widget/common_card.dart';
import 'package:i_table/features/place_search/domain/entity/place_search.dart';

import '../../../../domain/entity/place_hours.dart';

class PlaceDetailsSheet extends StatelessWidget {
  final PlaceSearch placeSearch;

  const PlaceDetailsSheet({super.key, required this.placeSearch});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        CommonCard(
            outerPadding: EdgeInsets.all(1),
            innerPadding: EdgeInsets.all(padding/2),
            backgroundColor: Colors.white,
            child: Column(
              children: [
                Text(placeSearch.placeName,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: padding/2),
                Text(placeSearch.placeDescription,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: padding/2),
                Text(openingHours,
                    style: Theme.of(context).textTheme.headlineSmall),
                Wrap(
                    alignment: WrapAlignment.center,
                    children:
                        _getOpeningHours(context, placeSearch.placeHours)),
              ],
            ))
      ],
    );
  }

  List<Widget> _getOpeningHours(
      BuildContext context, PlaceHours placeOpeningHours) {
    List<String> workDays = [];
    workDays.add('Pn.  ${placeOpeningHours.monday}');
    workDays.add('Wt.  ${placeOpeningHours.tuesday}');
    workDays.add('Śr.  ${placeOpeningHours.wednesday}');
    workDays.add('Czw.  ${placeOpeningHours.thursday}');
    workDays.add('Pt.  ${placeOpeningHours.friday}');
    workDays.add('Sb.  ${placeOpeningHours.saturday}');
    workDays.add('Nd.  ${placeOpeningHours.sunday}');

    return workDays
        .map((e) => Padding(
              padding: EdgeInsets.all(2),
              child: Chip(
                backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                label: Text(e, style: Theme.of(context).textTheme.bodySmall),
              ),
            ))
        .toList();
  }
}
