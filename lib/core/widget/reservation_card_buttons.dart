import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_table/core/widget/simple_filled_tonal_button.dart';
import 'package:i_table/features/place_menu/presentation/widget/place_menu_page/place_menu_page.dart';
import 'package:i_table/features/reservation_chat/presentation/widget/reservation_chat_page/reservation_chat_page.dart';

import '../../../../core/util/globals.dart';
import '../../features/place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../../features/user_orders/presentation/widget/user_orders_page/user_orders_page.dart';

class ReservationCardButtons extends StatelessWidget {
  final PlaceReservation placeReservation;

  const ReservationCardButtons({Key? key, required this.placeReservation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Offstage(
          offstage: !(placeReservation.status == 'new' ||
              placeReservation.status == 'active'),
          child: SimpleFilledTonalButton(
              title: newOrder,
              iconData: Icons.add_rounded,
              iconColor: Colors.indigo,
              iconSize: 25,
              onPressed: () {
                GoRouter.of(context)
                    .goNamed('placeMenuOnsite', pathParameters: {
                  'placeId': placeReservation.placeId,
                  'placeName': placeReservation.placeName,
                  'reservationId': placeReservation.id
                });
              }),
        ),
        Offstage(
            offstage: !(placeReservation.status == 'new' ||
                placeReservation.status == 'active' ||
                placeReservation.status == 'closed' ||
                placeReservation.status == 'cancelled'),
            child: IconButton(
                onPressed: () {
                  GoRouter.of(context).goNamed('chat', pathParameters: {
                    'placeId': placeReservation.placeId,
                    'reservationId': placeReservation.id
                  });
                },
                icon: Icon(
                  Icons.question_answer_rounded,
                  color: Colors.green,
                  size: 25,
                ))),
        Offstage(
          offstage: !(placeReservation.status == 'new' ||
              placeReservation.status == 'active' ||
              placeReservation.status == 'closed' ||
              placeReservation.status == 'cancelled'),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserOrdersPage(
                        userId: placeReservation.userId,
                        reservationId: placeReservation.id)));
              },
              icon: Icon(
                Icons.restaurant_menu_rounded,
                color: Colors.blueGrey,
                size: 25,
              )),
        ),
        Offstage(
          offstage: placeReservation.status != 'new',
          child: IconButton(
              onPressed: () {
                //launch(placeSearch.placeLocation);
              },
              icon: Icon(
                Icons.close_rounded,
                color: Colors.redAccent,
                size: 28,
              )),
        ),
        Offstage(
          offstage: placeReservation.status != 'active',
          child: IconButton(
              onPressed: () {
                //launch(placeSearch.placeLocation);
              },
              icon: Icon(
                Icons.check_rounded,
                color: Colors.redAccent,
                size: 28,
              )),
        ),
      ],
    );
  }
}
