import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/util/plan_builder.dart';
import '../../../../domain/entities/restaurant_plan/restaurant_setting.dart';
import '../../../bloc/restaurant_plan_bloc.dart';



class RestaurantPlan extends StatefulWidget {
  final RestaurantSetting restaurantSetting;
  late PlanBuilder planBuilder;

  RestaurantPlan(
      {Key? key, required double width, required double height, required this.restaurantSetting})
      : super(key: key) {
    planBuilder = PlanBuilder(width, height, restaurantSetting);
  }

  @override
  State<RestaurantPlan> createState() => _RestaurantPlanState();
}

class _RestaurantPlanState extends State<RestaurantPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white70,
        width: widget.planBuilder.desiredWidth.toDouble(),
        height: widget.planBuilder.desiredHeight.toDouble(),
        child: BlocBuilder<RestaurantPlanBloc, RestaurantPlanState>(
          builder: (context, state) {
            print('initState Plan fetch');
            RestaurantPlanFetchSuccess restaurantPlanFetchSuccess = state as RestaurantPlanFetchSuccess;
            return Center(child: widget.planBuilder.createPlan(this.context, restaurantPlanFetchSuccess.editMode));
          },
        )
    );
  }

  @override
  void initState() {
    super.initState();
    print('initState Plan');
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      widget.planBuilder.retainTextSize();
    });
  }
}
