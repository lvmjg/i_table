import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/util/plan_generator.dart';
import '../../../../../place/presentation/widgets/place_page/place_page.dart';
import '../../../../../place_search/domain/entities/place_search_entity.dart';
import '../../../../../reservation_entry/presentation/widgets/reservation_entry_page/reservation_entry_page.dart';

class ReserveButton extends StatelessWidget {
  final PlaceSearchEntity place;

  const ReserveButton({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Padding(
          padding: EdgeInsets.all(padding),
          child: Text(reserve),
        ),
        label: Icon(
          Icons.book_rounded,
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

          await ff.collection(pathPlacesPlans).doc('cgDV7yU93MjgXpSzsaaB').collection(pathPlacePlanLevels).doc('74GKfZ67s2nUmIcsS9Kc').update(planGenerator.getJson());*/

          if (debug) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    PlacePage(placeId: place.placeId)));
          } else {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ReservationEntryPage(place: place)));
          }
        });
  }
}
