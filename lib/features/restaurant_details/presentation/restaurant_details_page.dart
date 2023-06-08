import 'package:flutter/material.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/restaurant_details_body.dart';
import 'widgets/restuarant_details_app_bar.dart';

class RestaurantDetailsPage extends StatefulWidget {
  final String restaurantId;

  const RestaurantDetailsPage({Key? key, required this.restaurantId})
      : super(key: key);

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RestaurantDetailsAppBar(),
      body: RestaurantDetailsBody(restaurantId: widget.restaurantId),
    );
  }
}



