import 'package:flutter/material.dart';

import '../../../../../core/util/globals.dart';
import '../../../domain/entity/restaurant_details_entity.dart';

class RestaurantDescription extends StatelessWidget {
  const RestaurantDescription({
    super.key,
    required this.restaurantDetails,
  });

  final RestaurantDetailsEntity restaurantDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            restaurantDetails.restaurantDescription,
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
