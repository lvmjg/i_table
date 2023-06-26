import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/util/plan_generator.dart';
import '../../../bloc/restaurant_plan_bloc.dart';

class RestaurantPlanEditModeBar extends StatelessWidget {
  final AnimationController controller;

  const RestaurantPlanEditModeBar({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding/2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
              icon: Icon(
                Icons.close_rounded,
                color: Colors.red,
              ),
              label: Text('Anuluj', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                  elevation: 15,
                  backgroundColor: Colors.white,
                  foregroundColor: Color(primary),
                  side: BorderSide(width: 0, color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200)))),
              onPressed: () {
                  context.read<RestaurantPlanBloc>().add(RestaurantPlanEditModeCancelled());
              }),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
            'Wybrano 1 miejsce',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
                ],
              )),
          ElevatedButton.icon(
              icon: Text(
                reserve,
                style: TextStyle(fontSize: 14, color: Color(primary)),
              ),
              label: Icon(
                Icons.book_rounded,
                color: Color(primary),
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 15,
                  backgroundColor: Colors.white,
                  foregroundColor: Color(primary),
                  side: BorderSide(width: 0, color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200)))),
              onPressed: () async {

                 /* RestaurantPlanUseCase restaurantPlanUseCase =
              RestaurantPlanUseCase();*/
             /* await restaurantPlanUseCase
                  .fetchRestaurantSetting('abtkqzD6ogVAx594wf6B');*/
                 FirebaseFirestore ff = FirebaseFirestore.instance;

                  PlanGenerator planGenerator = PlanGenerator();

                  Map<String, dynamic> json = planGenerator.getJson();

                  await ff.collection('restaurantsPlans').doc('jd8UeiV4NykthEhlHUjs').collection('restaurantPlanLevels').doc('Dq1FOFAaTjGoHhq3xAr2').update(planGenerator.getJson());

/*
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RestaurantPlanPage()));*/



              }),
        ],
      ),
    );
  }


}
