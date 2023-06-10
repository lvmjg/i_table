import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/restaurant_plan_app_bar.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/body/restaurant_plan_body.dart';
import '../../../core/util/globals.dart';
import '../../../core/util/plan_manager.dart';

class RestaurantPlanPage extends StatefulWidget {
  const RestaurantPlanPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPlanPage> createState() => _RestaurantPlanPageState();
}

class _RestaurantPlanPageState extends State<RestaurantPlanPage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RestaurantPlanAppBar(),
      body: RestaurantPlanBody(),
    );
  }




}





