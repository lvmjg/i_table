import 'package:flutter/material.dart';
import 'package:i_table/core/util/plan_manager.dart';

import '../../../domain/entity/restaurant_plan/restaurant_setting.dart';

class RestaurantPlan extends StatefulWidget {
  final RestaurantSetting restaurantSetting;
  late PlanManager planManager;

  RestaurantPlan({Key? key, required double width, required double height, required this.restaurantSetting}) : super(key: key){
     planManager = PlanManager(width, height, restaurantSetting);
  }

  @override
  State<RestaurantPlan> createState() => _RestaurantPlanState();
}

class _RestaurantPlanState extends State<RestaurantPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white70,
        width: widget.planManager.desiredWidth.toDouble(),
        height: widget.planManager.desiredHeight.toDouble(),
        child:  Center(child: widget.planManager.createPlan(this.context))
    );
  }
}
