import 'package:flutter/material.dart';

import '../../../../../core/util/globals.dart';
import '../../../../../core/util/url_manager.dart';
import '../../../domain/entity/restaurant_details_entity.dart';

class RestaurantLocationUrl extends StatelessWidget {
  const RestaurantLocationUrl({
    super.key,
    required this.restaurantDetails,
  });

  final RestaurantDetailsEntity restaurantDetails;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      shape: CircleBorder(),
      elevation: 15,
      child: InkWell(
        onTap: () {
          launch(restaurantDetails.restaurantLocationUrl);
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
