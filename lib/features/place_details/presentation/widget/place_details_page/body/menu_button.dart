import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/simple_filled_tonal_button.dart';
import '../../../../../place_menu/presentation/widget/place_menu_page/place_menu_page.dart';

class MenuButton extends StatelessWidget {
  final String placeId;

  MenuButton({super.key, required this.placeId});

  @override
  Widget build(BuildContext context) {
    return SimpleFilledTonalButton(title: menu, iconData: Icons.menu_book_rounded, iconColor: Colors.indigo, onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceMenuPage(placeId: placeId)));
    });
  }
}
/*  FirebaseFirestore ff = FirebaseFirestore.instance;

          PlanGenerator planGenerator = PlanGenerator();

          Map<String, dynamic> json = planGenerator.getJson2();

          await ff.collection(pathPlacesPlans).doc('KsbEGvhvEGl27bcG3q7J').collection(pathPlacePlanLevels).doc('zUst63YXBwBhi9lFPSn0').update(planGenerator.getJson());*/
