import 'package:flutter/material.dart';

import '../../../domain/entity/restaurant_details_entity.dart';

class RestaurantName extends StatelessWidget {
  const RestaurantName({
    super.key,
    required this.restaurantDetails,
  });

  final RestaurantDetailsEntity restaurantDetails;

  @override
  Widget build(BuildContext context) {
    return Text(
      restaurantDetails.restaurantName,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
    );
  }
}
