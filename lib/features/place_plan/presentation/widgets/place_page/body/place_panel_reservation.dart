import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/util/plan_generator.dart';
import '../../../bloc/place_bloc.dart';

class PlacePanelReservation extends StatelessWidget {
  final AnimationController controller;

  const PlacePanelReservation({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
              icon: Icon(
                Icons.close_rounded,
                color: Colors.red,
              ),
              label: Text(remove, style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                  elevation: 15,
                  backgroundColor: Colors.white,
                  foregroundColor: Color(primary),
                  side: BorderSide(width: 0, color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200)))),
              onPressed: () {
                context.read<PlaceBloc>().add(
                    PlaceReservationElementsRemoved());
              }),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<PlaceBloc, PlaceState>(
                    builder: (context, state) {
                      if(state is PlaceFetchSuccess) {
                        String choosenElements = 'Wybierz miejsca\nna planie :)';

                        if(state.formatTracked.isNotEmpty){
                          choosenElements = state.formatTracked;
                          choosenElements+=state.formatTracked;
                        }

                        return Expanded(child: Padding(
                          padding: EdgeInsets.all(padding/2),
                          child: Center(
                            child: AutoSizeText(
                              choosenElements,
                              minFontSize: 1,
                              maxFontSize:  30,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ));
                      }

                      return Container();
                    },
                  ),
                ],
              )),
          ElevatedButton.icon(
              icon: Icon(
                Icons.add_rounded,
                color: Colors.green,
              ),
              label: Text(add, style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                  elevation: 15,
                  backgroundColor: Colors.white,
                  foregroundColor: Color(primary),
                  side: BorderSide(width: 0, color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200)))),
              onPressed: () {
                context.read<PlaceBloc>().add(PlaceReservationElementsAdded());
              }),

          /*  ElevatedButton.icon(
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
              onPressed: () async {*/

          /* RestaurantPlanUseCase restaurantPlanUseCase =
              RestaurantPlanUseCase();*/
          /* await restaurantPlanUseCase
                  .fetchRestaurantSetting('abtkqzD6ogVAx594wf6B');*/


/*
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RestaurantPlanPage()));*/


          // }),
        ],
      ),
    );
  }


}
