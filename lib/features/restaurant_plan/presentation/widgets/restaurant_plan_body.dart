import 'package:flutter/material.dart';
import '../../../../core/util/plan_manager.dart';

class RestaurantPlanBody extends StatelessWidget {
  const RestaurantPlanBody({
    super.key,
    required this.plan,
  });

  final PlanManager plan;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: DropdownButton(items: [], onChanged: (value) {  },
                      )),
                  Expanded(
                      flex: 1,
                      child: DropdownButton(items: [], onChanged: (value) {  },
                      ))
                ],
              )
            ],
          ),



          Container(
            color: Colors.white,
            child: Center(
              child: InteractiveViewer(
                  minScale: 1,
                  scaleFactor: 1,
                  maxScale: 10,
                  child: plan.createPlan()),


              /*  Material(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              shape: const CircleBorder(side: BorderSide.none),
              elevation: 15,
              child: InkWell(
                onTap: (){ print("tapped");},
                child: Ink(
                  color: Colors.blue,
                  child: CircleAvatar(
    backgroundColor: Colors.transparent,
                    child: Text('l'),
                  ),
                ),
              ),
            )*/
            ),
          ),

        ]
    );
  }
}
