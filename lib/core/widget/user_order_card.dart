import 'package:flutter/material.dart';
import 'package:i_table/core/widget/common_divider.dart';
import 'package:i_table/core/widget/common_card.dart';
import 'package:i_table/features/user_orders/domain/entity/place_order.dart';
import 'package:intl/intl.dart';

import '../util/globals.dart';

class UserOrderCard extends StatelessWidget {
  final PlaceOrder order;

  const UserOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        onPressed: () {},
        outerPadding: padding / 2,
        child: Column(
          children: [
            Text('$orderNo ${order.no!.toUpperCase()}',
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: padding),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(order.placeName,
                  style: Theme.of(context).textTheme.bodyMedium),
              Text(DateFormat('dd.MM.yyyy').format(order.orderDateTime),
                  style: Theme.of(context).textTheme.bodyMedium),
            ]),
            SizedBox(height: padding),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RichText(
                text: TextSpan(
                    text: '$totalCost ',
                    children: <InlineSpan>[
                      TextSpan(
                          text: '${order.totalCost} zł',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              Text(DateFormat('HH:mm').format(order.orderDateTime),
                  style: Theme.of(context).textTheme.bodyMedium),
            ]),
            SizedBox(height: padding),
            CommonDivider(),
            ListView.builder(
                shrinkWrap: true,
                itemCount: order.userOrders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text((index + 1).toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: primaryColor)),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: padding / 4),
                      child: Text(order.userOrders[index].name,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    subtitle: Text(order.userOrders[index].description,
                        style: Theme.of(context).textTheme.bodySmall),
                    trailing: Text(
                        '${order.userOrders[index].price} x${order.userOrders[index].quantity} = ${order.userOrders[index].cost}',
                        style: Theme.of(context).textTheme.bodyMedium),
                  );
                }),
            SizedBox(height: padding),
          ],
        ));
  }
}
