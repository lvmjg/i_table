import 'package:flutter/material.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/user_orders/presentation/widget/user_orders_page/user_orders_body/user_orders_body.dart';
import 'package:i_table/features/user_reservations/presentation/widget/user_reservations_page/user_reservations_body/user_reservations_body.dart';
import 'package:i_table/features/user_reservations/presentation/widget/user_reservations_page/user_reservations_page.dart';

class UserActionsBody extends StatelessWidget {
  final List<String> categories;

  const UserActionsBody({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        children: [
          UserReservationsBody(),
          UserOrdersBody(userId: loggedUserId)
        ]
    );
  }
}
