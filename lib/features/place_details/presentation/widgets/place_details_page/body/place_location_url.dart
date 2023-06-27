import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/util/url_manager.dart';
import '../../../../domain/entity/place_details_entity.dart';

class PlaceLocationUrl extends StatelessWidget {
  const PlaceLocationUrl({
    super.key,
    required this.placeDetails,
  });

  final PlaceDetailsEntity placeDetails;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      shape: CircleBorder(),
      elevation: 15,
      child: InkWell(
        onTap: () {
          launch(placeDetails.placeLocationUrl);
        },
        child: Ink(
          color: Color(primary),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.location_on_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
