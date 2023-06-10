import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/body/restaurant_plan_date_time_picker_bar.dart';

import '../../../../../core/util/globals.dart';
import '../../../../../core/util/plan_generator.dart';
import '../../restaurant_plan_page.dart';

class RestaurantPlanBottomReservationPanel extends StatelessWidget {
  const RestaurantPlanBottomReservationPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(primary),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(padding), topRight:Radius.circular(padding))
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(padding/4),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Data',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Godzina',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          RestaurantPlanDateTimePickerBar(),
          Padding(
            padding: EdgeInsets.all(padding / 2),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Wybrano 1 miejsce',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )),
                ElevatedButton.icon(
                    icon: Text(
                      'Rezerwuj',
                      style: TextStyle(fontSize: 14, color: Color(primary)),
                    ),
                    label: Icon(
                      Icons.book_rounded,
                      color: Color(primary),
                      //  size: 10,
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 15,
                        backgroundColor: Colors.white,
                        foregroundColor: Color(primary),
                        side: BorderSide(width: 0, color: Colors.white),

                        shape: RoundedRectangleBorder(
                            // side: BorderSide.,
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)))),
                    onPressed: () {
                      FirebaseFirestore ff = FirebaseFirestore.instance;

                      PlanGenerator planGenerator = PlanGenerator();

                      Map<String, dynamic> aaJson = planGenerator.getJson();

                      // await ff.collection('restaurantsConfigurations').doc('7L1t8zERwsXHKNsC9jKB').collection('restaurantPlan').doc('ju3kxqHf1cK4orAq3Vmz').update(planGenerator.getJson());

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RestaurantPlanPage()));
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
