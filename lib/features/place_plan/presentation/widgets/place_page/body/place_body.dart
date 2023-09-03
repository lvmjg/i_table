import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/place_plan/presentation/widgets/place_page/body/place_panel.dart';
import 'package:i_table/features/place_plan/presentation/widgets/place_page/body/place_plan.dart';
import 'package:i_table/features/place_plan/presentation/widgets/place_page/body/reserve_button.dart';
import '../../../../../../core/presentation/widgets/failure.dart';
import '../../../bloc/place_bloc.dart';

class PlaceBody extends StatefulWidget {
  PlaceBody({
    super.key,
  });

  @override
  State<PlaceBody> createState() => _PlaceBodyState();
}

class _PlaceBodyState extends State<PlaceBody>{



  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Expanded(
            child: Stack(
              children: [Padding(
                padding: EdgeInsets.all(padding / 2),
                child: InteractiveViewer(
                  minScale: 1,
                  scaleFactor: 1.5,
                  maxScale: 2,
                  boundaryMargin: EdgeInsets.all(padding * 2),
                  child: LayoutBuilder(builder: (context, constraints) {
                    return BlocBuilder<PlaceBloc, PlaceState>(
                        builder: (context, state) {

                          if (state is PlaceFetchFailure) {
                            return Failure(
                                errorMessage: errorFetchPlace,
                                onPressed: () => context.read<PlaceBloc>().add(
                                    PlaceInitiated(placeId: state.placeId, reservationTime: DateTime.now())));
                          }
                          else if (state is PlaceFetchInProgress) {
                            return SizedBox(
                                child: Center(
                                    child: CircularProgressIndicator(
                                        color: Color(primary))));
                          }
                         else if (state is PlaceFetchSuccess) {
                        return Center(
                            child: PlacePlan(
                                width: constraints.maxWidth,
                                height: constraints.maxHeight,
                                placeConfiguration: state.placeConfiguration!));
                      }

                      return Container();
                    });
                  }),
                ),
              ),
/*
                Align(
                  alignment: Alignment.bottomLeft,
                  child:  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(200)
                    ),
                    height: 40,
                    child: Center(
                      child: DropdownButton(
                        value: '1',
                        icon: Icon(Icons.arrow_drop_down_rounded, size: 30, color: Colors.black),
                        underline: Container(),
                        items: [
                          DropdownMenuItem<String>(
                              value: '1',
                              child: Text('Piętro 1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black))),
                          DropdownMenuItem<String>(
                              value: '2',
                              child: Text('Piętro 2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black))),
                        ],
                        onChanged: (Object? value) {},
                      ),
                    ),
                  ),
                ),
*/

                Align(
                 alignment: Alignment.bottomRight,
                 child: Padding(
                   padding: EdgeInsets.all(padding/2),
                   child: ReserveButton()
                 ),
                )

              ],
            ),
          ),
          Center(child: PlacePanel())
        ],
      ),

    ]);
  }


}
