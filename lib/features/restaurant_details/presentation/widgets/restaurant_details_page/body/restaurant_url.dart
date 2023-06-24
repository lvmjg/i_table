import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/util/url_manager.dart';
import '../../../../domain/entity/restaurant_details_entity.dart';

class RestaurantUrl extends StatelessWidget {
  const RestaurantUrl({
    super.key,
    required this.restaurantDetails,
  });

  final RestaurantDetailsEntity restaurantDetails;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      elevation: 15,
      child: InkWell(
        onTap: () {
          launch(restaurantDetails.restaurantUrl);
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
