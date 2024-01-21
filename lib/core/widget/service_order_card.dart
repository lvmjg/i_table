import 'package:flutter/material.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/core/widget/common_divider.dart';
import 'package:i_table/core/widget/common_card.dart';
import 'package:intl/intl.dart';

import '../place_order/domain/entity/place_order.dart';
import '../util/globals.dart';

class ServiceOrderCard extends StatelessWidget {
  final PlaceOrder order;

  const ServiceOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        onPressed: () {},
        outerPadding: padding / 8,
        innerPadding: padding / 3,
        child: Column(
          children: [
            Text('$orderNo ${order.no!.toUpperCase()}',
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: padding),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RichText(
                text: TextSpan(
                    text: '$reservation ',
                    children: <InlineSpan>[
                      TextSpan(
                          text: order.reservationId != null
                              ? order.reservationId!
                                  .substring(0, 6)
                                  .toUpperCase()
                              : '-',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium),
                    ],
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              Text(DateFormat('dd.MM.yyyy').format(order.orderDateTime),
                  style: Theme.of(context).textTheme.bodyMedium),
            ]),
            SizedBox(height: padding),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RichText(
                text: TextSpan(
                    text: '$username ',
                    children: <InlineSpan>[
                      TextSpan(
                          text: order.userId,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium),
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
                    subtitle: Wrap(direction: Axis.vertical, children: [
                      Offstage(
                        offstage:
                            order.userOrders[index].note == StringUtil.EMPTY,
                        child: Wrap(direction: Axis.vertical, children: [
                          SizedBox(height: padding / 4),
                          RichText(
                            text: TextSpan(
                              text: '$note ',
                              children: <InlineSpan>[
                                TextSpan(
                                    text: order.userOrders[index].note,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.red)),
                              ],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                            ),
                          )
                        ]),
                      ),
                    ]),
                    trailing: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text('x${order.userOrders[index].quantity}',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Checkbox(value: false, onChanged: (value) {})
                      ],
                    ),
                  );
                }),
            CommonDivider(),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(completed,
                      style: Theme.of(context).textTheme.bodyMedium),
                  Checkbox(value: false, onChanged: (value) {})
                ],
              ),
            ),
          ],
        ));
  }
}
