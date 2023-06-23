import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/body/restaurant_details_body.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/appbar/restuarant_details_appbar.dart';
import 'bloc/restaurant_details_bloc.dart';

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

  @override
  void initState() {
    super.initState();
    context
        .read<RestaurantDetailsBloc>()
        .add(RestaurantDetailsInit(restaurantId: widget.restaurantId));
  }
}
