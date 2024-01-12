import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_table/core/widget/simple_filled_tonal_button.dart';
import 'package:i_table/features/user_orders/presentation/widget/user_orders_page/user_orders_body/user_orders_body.dart';
import 'package:i_table/features/user_reservations/presentation/widget/user_reservations_page/user_reservations_body/user_reservations_body.dart';
import 'package:i_table/features/user_reservations/presentation/widget/user_reservations_page/user_reservations_page.dart';

import '../../../../../../core/util/globals.dart';
import '../../user_details_page/user_details_page.dart';

class UserProfileBody extends StatelessWidget {

  const UserProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: Text('Jan Godlewski',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Text('janxgodlewski@gmail.com',
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            SimpleFilledTonalButton(
                title: 'Więcej informacji',
                onPressed: (){
                  GoRouter.of(context).go('/userProfile/userDetails');
                },
            ),
            SizedBox(height: padding),
            SimpleFilledTonalButton(
                title: kitchen,
                onPressed:  () => GoRouter.of(context).go('/userProfile/serviceOrders')),
            SizedBox(height: padding),
            SimpleFilledTonalButton(
                title: service,
                onPressed: () => GoRouter.of(context).go('/userProfile/servicePlace')),
          ],
      ),
    );
  }
}
