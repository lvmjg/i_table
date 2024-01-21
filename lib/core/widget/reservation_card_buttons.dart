import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_table/core/usecase/usecase.dart';
import 'package:i_table/core/util/dialog_util.dart';
import 'package:i_table/core/widget/simple_filled_tonal_button.dart';
import 'package:i_table/features/user_reservations/presentation/bloc/user_reservations_bloc.dart';

import '../../../../core/util/globals.dart';
import '../../features/place_plan/domain/entity/place_reservation/place_reservation.dart';

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
          offstage: placeReservation.status != 'new' &&
              placeReservation.status != 'active',
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
        IconButton(
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
            )),
        IconButton(
            onPressed: () {
              GoRouter.of(context).goNamed('orders',
                  pathParameters: {'reservationId': placeReservation.id});
            },
            icon: Icon(
              Icons.restaurant_menu_rounded,
              color: Colors.blueGrey,
              size: 25,
            )),
        Offstage(
          offstage: placeReservation.status != 'new',
          child: IconButton(
              onPressed: () async {
                if (await DialogUtil.showConfirmationDialog(context,
                cancelReservationTitle, cancelReservationContent, dialogBack, dialogCancel)) {

                context.read<UserReservationsBloc>().add(UserReservationsStatusChanged(params:
                ReservationChangeStatusParams(
                reservationId: placeReservation.id,
                closeStatus: placeReservation.status,
                closedBy: loggedUserId,
                startDate: placeReservation.startDate))
                );
                }
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
                onPressed: () async {
                  if (await DialogUtil.showConfirmationDialog(context,
                      closeReservationTitle, closeReservationContent, dialogBack, dialogClose)) {

                    context.read<UserReservationsBloc>().add(UserReservationsStatusChanged(params:
                    ReservationChangeStatusParams(
                        reservationId: placeReservation.id,
                        closeStatus: placeReservation.status,
                        closedBy: loggedUserId,
                    startDate: placeReservation.startDate))
                    );
                  }
                },
                icon: Icon(
                  Icons.check_rounded,
                  color: Colors.redAccent,
                  size: 28,
                ))),
      ],
    );
  }
}
