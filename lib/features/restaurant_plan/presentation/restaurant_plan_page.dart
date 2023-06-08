import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    PlanManager plan = PlanManager(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Icon(Icons.book_rounded, color: Colors.white), icon: Text('Rezerwuj') ,),
      appBar: AppBar(
        systemOverlayStyle:
        SystemUiOverlayStyle(statusBarColor: Color(primary)),
        shape: roundedRectangleBorder,
        flexibleSpace:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              appName,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ]),
        backgroundColor: Color(primary),
      ),
      body: Stack(
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
      ),
    );
  }




}
