import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/simple_filled_tonal_button.dart';
import 'package:i_table/features/place_menu/presentation/widget/place_menu_page/place_menu_page.dart';
import 'package:i_table/features/reservation_chat/presentation/widget/reservation_chat_page/reservation_chat_page.dart';

import '../../../../core/util/globals.dart';
import '../../features/place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../../features/user_orders/presentation/widget/user_orders_page/user_orders_page.dart';

class ReservationCardButtons extends StatelessWidget {
  final PlaceReservation placeReservation;

  const ReservationCardButtons({Key? key, required this.placeReservation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        runSpacing: 2,
        alignment: WrapAlignment.center,
        children: [
          Visibility(
              visible: placeReservation.status == 'new' || placeReservation.status == 'confirmed',
              child: Padding(
                padding: EdgeInsets.all(padding/8),
                child: SimpleFilledTonalButton(title: 'Anuluj', iconData: Icons.close_rounded, iconColor: Colors.red, onPressed: (){}),
              )
          ),
          Visibility(
              visible: placeReservation.status == 'new',
              child: Padding(
                padding: EdgeInsets.all(padding/8),
                child: SimpleFilledTonalButton(title: 'Potwiedź', iconData: Icons.done_rounded, iconColor: Colors.green, onPressed: (){}),
              )
          ),
          Visibility(
            visible: placeReservation.status == 'active',
            child: Padding(
              padding: EdgeInsets.all(padding/8),
              child: SimpleFilledTonalButton(title: 'Menu', iconData: Icons.menu_book_rounded, iconColor: Colors.indigo, onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceMenuPage(placeId: placeReservation.placeId, reservationId: placeReservation.id)));
              }),
            )
          ),
          Visibility(
            visible: placeReservation.status == 'active',
            child: Padding(
              padding: EdgeInsets.all(padding/8),
              child: SimpleFilledTonalButton(title: 'Zamówienia', iconData: Icons.restaurant_menu_rounded, iconColor: Colors.blueGrey, onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserOrdersPage(userId: placeReservation.userId, reservationId: placeReservation.id)));
              }),
            )
          ),
          Visibility(
            visible: placeReservation.status == 'active',
            child: Padding(
              padding: EdgeInsets.all(padding/8),
              child: SimpleFilledTonalButton(title: 'Chat', iconData: Icons.question_answer_rounded, iconColor: Colors.green, onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReservationChatPage(placeId: placeReservation.placeId, reservationId: placeReservation.id)));
              }),
            )
  ),
          Visibility(
              visible: placeReservation.status == 'active',
              child: Padding(
                padding: EdgeInsets.all(padding/8),
                child: SimpleFilledTonalButton(title: 'Wezwij kelnera i zapłać', iconData: Icons.attach_money_rounded, iconColor: Colors.amber, onPressed: (){
                  //context.read<UserReservationsBloc>().add(event)
                }, padding: 2),
              )
          ),
        ],
      ),
    );
  }
}
