import 'package:flutter/material.dart';

import '../../../../domain/entity/restaurant_details_entity.dart';

class RestaurantAddress extends StatelessWidget {
  const RestaurantAddress({
    super.key,
    required this.restaurantDetails,
  });

  final RestaurantDetailsEntity restaurantDetails;

  @override
  Widget build(BuildContext context) {
    return Text(
      restaurantDetails.restaurantAddress.toString(),
      style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w200,
          decoration: TextDecoration.underline),
    );
  }
}
