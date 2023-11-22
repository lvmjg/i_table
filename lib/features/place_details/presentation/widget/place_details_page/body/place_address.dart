import 'package:flutter/material.dart';

import '../../../../domain/entity/place_details.dart';

class PlaceAddress extends StatelessWidget {
  const PlaceAddress({
    super.key,
    required this.placeDetails,
  });

  final PlaceDetails placeDetails;

  @override
  Widget build(BuildContext context) {
    return Text(
      placeDetails.placeAddress.toString(),
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
    );
  }
}
