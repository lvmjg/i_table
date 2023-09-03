import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:i_table/features/user_reservations/presentation/widget/user_reservations_page.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../place_search/presentation/widgets/search_page/place_search_page.dart';


class MyReservationsButton extends StatelessWidget {

  const MyReservationsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Padding(
          padding: EdgeInsets.all(padding),
          child: Text(myRservations),
        ),
        label: Icon(
          Icons.book_rounded,
          color: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
            side: BorderSide.none,
            backgroundColor: Color(primary),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(200)))),
        onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => UserReservationsPage()));

    if (debug) {


    /* Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                PlaceSearchPage()));*/
    } else {
    /*   Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ReservationEntryPage(place: place)));*/
    }

/*
          FirebaseFunctions functions = FirebaseFunctions.instance;
          HttpsCallable httpsCallable = functions.httpsCallable('helloWorld');
          httpsCallable.call({
            'id':'test',
            'sittings':['S1', 'S2'],
            'groups':{
              "group1":['S22', 'S23']
            }
          });*/
        });

  }
}
