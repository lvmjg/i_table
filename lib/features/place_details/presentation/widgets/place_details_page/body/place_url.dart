import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/util/url_manager.dart';
import '../../../../domain/entities/place_details.dart';

class PlaceUrl extends StatelessWidget {
  const PlaceUrl({
    super.key,
    required this.placeDetails,
  });

  final PlaceDetails placeDetails;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      elevation: 15,
      child: InkWell(
        onTap: () {
          launch(placeDetails.placeUrl);
        },
        child: Ink(
          color: Color(primary),
          child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                UniconsLine.globe,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
