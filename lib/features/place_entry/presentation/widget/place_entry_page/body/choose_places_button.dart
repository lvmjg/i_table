import 'package:flutter/material.dart';
import 'package:i_table/core/widget/simple_filled_tonal_button.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../place_plan/presentation/widget/place_page/place_page.dart';

class ChoosePlacesButton extends StatelessWidget {
  final String placeId;

  const ChoosePlacesButton({super.key, required this.placeId});

  @override
  Widget build(BuildContext context) {
    return SimpleFilledTonalButton(
        title: choosePlaces,
      iconData: Icons.subdirectory_arrow_right_rounded,
      iconColor: Colors.green,
      padding: padding/4*3,
      onPressed:  () {
        /*  FirebaseFirestore ff = FirebaseFirestore.instance;

          PlanGenerator planGenerator = PlanGenerator();

          Map<String, dynamic> json = planGenerator.getJson2();

          await ff.collection(pathPlacesPlans).doc('KsbEGvhvEGl27bcG3q7J').collection(pathPlacePlanLevels).doc('zUst63YXBwBhi9lFPSn0').update(planGenerator.getJson());*/

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlacePage(placeId: placeId,)));
      },
    );
  }
}
