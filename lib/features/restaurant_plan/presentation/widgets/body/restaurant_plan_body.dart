import 'package:flutter/material.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/body/restaurant_plan_bottom_reservation_panel.dart';

import '../../../../../core/util/plan_manager.dart';

class RestaurantPlanBody extends StatefulWidget {
  RestaurantPlanBody({
    super.key,
  });

  @override
  State<RestaurantPlanBody> createState() => _RestaurantPlanBodyState();
}

class _RestaurantPlanBodyState extends State<RestaurantPlanBody> {

  @override
  Widget build(BuildContext context) {
   // print('w ${context.size!.width}');
   // print('h ${context.size!.height}');
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(padding / 2),
            child: InteractiveViewer(
              minScale: 1,
              scaleFactor: 1.5,
              maxScale: 2,
              boundaryMargin: EdgeInsets.all(padding * 2),
              child: LayoutBuilder(builder: (context, constraints) {
                PlanManager planManager = PlanManager(constraints.maxWidth, constraints.maxHeight);
                return Center(
                  child: Container(
                    //  color: Colors.white70,
                      color: Colors.red,
                      width: planManager.desiredWidth.toDouble(),
                      height: planManager.desiredHeight.toDouble(),
                      child: Center(child: planManager.createPlan(context))),
                );
              }),
            ),
          ),
        ),
        RestaurantPlanBottomReservationPanel()
      ],
    );
  }
}
