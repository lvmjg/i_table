import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/restaurant_plan_page/body/restaurant_plan_date_time_picker_bar.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/restaurant_plan_page/body/restaurant_plan_edit_mode_bar.dart';

import '../../../../../../core/util/globals.dart';

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
        child: Center(
          child: Stack(clipBehavior: Clip.hardEdge, children: [
            ClipRRect(
              child: SlideTransition(
                  position: _offsetAnimation1,
                  child: InkWell(
                    onTap: (){_controller.forward();},
                    child: Container(
                        height: 85, child: RestaurantPlanDateTimePickerBar()),
                  )),
            ),
            ClipRRect(
              child: SlideTransition(
                position: _offsetAnimation2,
                child: Container(
                  height:85,
                  child: RestaurantPlanEditModeBar(controller: _controller),
                ),
              ),
            )
          ]),
        ));
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 100),
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
    _controller.forward();
  }
}
