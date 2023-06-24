import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/restaurant_plan/presentation/bloc/restaurant_plan_bloc.dart';

import 'package:panorama/panorama.dart';

import 'appbar/restaurant_plan_app_bar.dart';
import 'body/restaurant_plan_body.dart';

class RestaurantPlanPage extends StatefulWidget {
  final String restaurantId;

  const RestaurantPlanPage({Key? key, required this.restaurantId}) : super(key: key);

  @override
  State<RestaurantPlanPage> createState() => _RestaurantPlanPageState();
}

class _RestaurantPlanPageState extends State<RestaurantPlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RestaurantPlanAppBar(),
      body: RestaurantPlanBody()
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<RestaurantPlanBloc>().add(RestaurantPlanInitiated(
        restaurantId: widget.restaurantId, reservationTime: DateTime.now()));
  }
}





