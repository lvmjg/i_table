import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../domain/entity/place_details.dart';

class PlaceDescription extends StatelessWidget {
  const PlaceDescription({
    super.key,
    required this.placeDetails,
  });

  final PlaceDetails placeDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            placeDetails.placeDescription,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
