import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../place_entry/presentation/widgets/place_entry_page/place_entry_page.dart';
import '../../../../../place_menu/presentation/widget/place_menu_page/place_menu_page.dart';
import '../../../../../place_plan/presentation/widgets/place_page/place_page.dart';

class MenuButton extends StatelessWidget {
  final String placeId;

  MenuButton({super.key, required this.placeId});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Padding(
          padding: EdgeInsets.all(padding/1.2),
          child: Text(menu),
        ),
        label: Icon(
          Icons.menu_book_rounded,
          color: Colors.white,
          //  size: 10,
        ),
        style: ElevatedButton.styleFrom(
            side: BorderSide(width: 0, color: Colors.white),
            backgroundColor: Color(primary),
            shape: RoundedRectangleBorder(
              // side: BorderSide.,
                borderRadius: BorderRadius.all(Radius.circular(200)))),
        onPressed: () async {
          /*  FirebaseFirestore ff = FirebaseFirestore.instance;

          PlanGenerator planGenerator = PlanGenerator();

          Map<String, dynamic> json = planGenerator.getJson2();

          await ff.collection(pathPlacesPlans).doc('KsbEGvhvEGl27bcG3q7J').collection(pathPlacePlanLevels).doc('zUst63YXBwBhi9lFPSn0').update(planGenerator.getJson());*/

          if (debug) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PlaceMenuPage(placeId: placeId)));
          } else {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PlaceEntryPage(placeId: placeId,)));
          }
        });
  }
}
