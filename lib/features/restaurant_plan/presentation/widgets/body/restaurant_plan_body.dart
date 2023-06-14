import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/body/restaurant_plan.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/body/restaurant_plan_bottom_reservation_panel.dart';

import '../../../../../core/util/plan_manager.dart';
import '../../bloc/restaurant_plan_bloc.dart';

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
                return BlocBuilder<RestaurantPlanBloc, RestaurantPlanState>(
                    builder: (context, state) {
                  if (state is RestaurantPlanFetchSuccess) {
                    return Center(
                      child: RestaurantPlan(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          restaurantSetting: state.restaurantSetting
                      )
                    );
                  }
                  else if(state is RestaurantPlanFetchInProgress){
                    return SizedBox(
                        child: Center(
                            child: CircularProgressIndicator(
                                color: Color(primary))));
                  }

                  return Container();
                });
              }),
            ),
          ),
        ),
        RestaurantPlanBottomReservationPanel()
      ],
    );
  }
}
