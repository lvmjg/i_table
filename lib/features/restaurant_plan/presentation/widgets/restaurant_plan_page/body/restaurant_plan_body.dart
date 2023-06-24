import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/restaurant_plan_page/body/restaurant_plan.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/restaurant_plan_page/body/restaurant_plan_bottom_reservation_panel.dart';

import '../../../bloc/restaurant_plan_bloc.dart';

class RestaurantPlanBody extends StatefulWidget {

  RestaurantPlanBody({
    super.key,
  });

  @override
  State<RestaurantPlanBody> createState() => _RestaurantPlanBodyState();
}

class _RestaurantPlanBodyState extends State<RestaurantPlanBody>{
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Expanded(
            child: Stack(
              children: [Padding(
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
                                restaurantSetting: state.restaurantSetting));
                      } else if (state is RestaurantPlanFetchInProgress) {
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

                Align(
                  alignment: Alignment.bottomRight,
                  child:  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(200)),
                    height: 40,
                    child: Center(
                      child: DropdownButton(
                        value: '1',
                        icon: Icon(Icons.arrow_drop_down_rounded, size: 30, color: Colors.black),
                        underline: Container(),
                        items: [
                          DropdownMenuItem<String>(
                              value: '1',
                              child: Text('Piętro 1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black))),
                          DropdownMenuItem<String>(
                              value: '2',
                              child: Text('Piętro 2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black))),
                        ],
                        onChanged: (Object? value) {},
                      ),
                    ),
                  ),
                )


              ],
            ),
          ),
          Center(child: RestaurantPlanBottomReservationPanel())
        ],
      ),

    ]);
  }


}
