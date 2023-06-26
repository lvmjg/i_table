import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/restaurant_plan_page/body/restaurant_plan_date_time_picker_bar.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/restaurant_plan_page/body/restaurant_plan_edit_mode_bar.dart';

import '../../../../../../core/util/globals.dart';
import '../../../bloc/restaurant_plan_bloc.dart';

class RestaurantPlanBottomReservationPanel extends StatefulWidget {
  RestaurantPlanBottomReservationPanel({Key? key}) : super(key: key);

  @override
  State<RestaurantPlanBottomReservationPanel> createState() =>
      _RestaurantPlanBottomReservationPanelState();
}

class _RestaurantPlanBottomReservationPanelState
    extends State<RestaurantPlanBottomReservationPanel>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        decoration: BoxDecoration(
            color: Color(primary),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(padding),
                topRight: Radius.circular(padding))),
        child: BlocListener<RestaurantPlanBloc, RestaurantPlanState>(
          listener: (context, state) {
            if(state is RestaurantPlanFetchSuccess) {
              RestaurantPlanFetchSuccess restaurantPlanFetchSuccess = state as RestaurantPlanFetchSuccess;

              if (restaurantPlanFetchSuccess.editMode) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            }
          },
          child: Stack(clipBehavior: Clip.hardEdge, children: [
            ClipRRect(
              child: SlideTransition(
                  position: _offsetAnimation1,
                  child: Container(
                      height: 85,
                      child: RestaurantPlanDateTimePickerBar())),
            ),
            ClipRRect(
              child: SlideTransition(
                position: _offsetAnimation2,
                child: Container(
                  height: 85,
                  child: RestaurantPlanEditModeBar(
                      controller: _controller),
                ),
              ),
            )
          ]),
        ));
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  /* late final AnimationController _controller2 = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);*/

  late final Animation<Offset> _offsetAnimation1 = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, -1),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  late final Animation<Offset> _offsetAnimation2 = Tween<Offset>(
    begin: const Offset(0, 1),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  @override
  void dispose() {
    _controller.dispose();
    // _controller2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
