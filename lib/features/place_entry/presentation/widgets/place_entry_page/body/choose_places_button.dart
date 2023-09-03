import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../place_plan/presentation/widgets/place_page/place_page.dart';

class ChoosePlacesButton extends StatelessWidget {
  final String placeId;

  const ChoosePlacesButton({super.key, required this.placeId});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Padding(
          padding: EdgeInsets.all(padding),
          child: Text(choosePlaces, style: TextStyle(
            color: Colors.black
          ),),
        ),
        label: Icon(
          Icons.subdirectory_arrow_right_rounded,
          color: Colors.green,
          //  size: 10,
        ),

        style: ElevatedButton.styleFrom(
            side: BorderSide(width: 0, color: Colors.white),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.grey,
            shape: RoundedRectangleBorder(
              // side: BorderSide.,
                borderRadius: BorderRadius.all(Radius.circular(200)))),
        onPressed: () async {
          /*  FirebaseFirestore ff = FirebaseFirestore.instance;

          PlanGenerator planGenerator = PlanGenerator();

          Map<String, dynamic> json = planGenerator.getJson2();

          await ff.collection(pathPlacesPlans).doc('KsbEGvhvEGl27bcG3q7J').collection(pathPlacePlanLevels).doc('zUst63YXBwBhi9lFPSn0').update(planGenerator.getJson());*/

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PlacePage(placeId: placeId,)));
        });
  }
}
