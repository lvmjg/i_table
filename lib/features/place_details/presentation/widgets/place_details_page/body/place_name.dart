import 'package:flutter/material.dart';

import '../../../../domain/entity/place_details_entity.dart';

class PlaceName extends StatelessWidget {
  const PlaceName({
    super.key,
    required this.placeDetails,
  });

  final PlaceDetailsEntity placeDetails;

  @override
  Widget build(BuildContext context) {
    return Text(
      placeDetails.placeName,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
    );
  }
}
