import 'package:flutter/material.dart';
import 'package:i_table/core/place_order/domain/entity/place_order.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/core/widget/common_divider.dart';
import 'package:i_table/core/widget/common_card.dart';
import 'package:intl/intl.dart';

import '../place_order/data/model/order_status.dart';
import '../util/globals.dart';

class UserOrderCard extends StatelessWidget {
  final PlaceOrder order;

  const UserOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        onPressed: () {},
        outerPadding: EdgeInsets.all(padding / 8),
        innerPadding: EdgeInsets.all(padding / 3),
        child: Column(
          children: [
            Text(_setCardTitleBasedOnOrderType(order.reservationId),
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: padding),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(order.placeName,
                  style: Theme.of(context).textTheme.bodyMedium),
              RichText(
                text: TextSpan(
                    text: '$totalCost ',
                    children: <InlineSpan>[
                      TextSpan(
                          text: '${order.totalCost}zł',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium),
                    ],
                    style: Theme.of(context).textTheme.bodyMedium),
              )
            ]),
            SizedBox(height: padding),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                    text: '$preparedTill ',
                    children: <InlineSpan>[
                      TextSpan(
                          text: DateFormat('dd.MM.yyyy HH:mm').format(order.mealDate),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium),
                    ],
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
            SizedBox(height: padding),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        text: '$status ',
                        children: <InlineSpan>[
                          TextSpan(
                              text: _translateStatus(order.status),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                  color: _setColorBasedOnStatus(order.status)
                              ))
                        ],
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  Text(DateFormat('dd.MM.yyyy HH:mm').format(order.mealDate),
                      style: Theme.of(context).textTheme.bodySmall),
            ]),
            CommonDivider(),
            ListView.builder(
                shrinkWrap: true,
                itemCount: order.userOrders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text((index + 1).toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: primaryColor)),
                    title: Text(order.userOrders[index].name,
                        style: Theme.of(context).textTheme.bodySmall),
                    subtitle: _setRemarks(context, order.userOrders[index].note),
                    trailing: Text(
                        '${order.userOrders[index].price} x${order.userOrders[index].quantity} = ${order.userOrders[index].cost}zł',
                        style: Theme.of(context).textTheme.bodySmall),
                  );
                }),
          ],
        ));
  }
  
  String _setCardTitleBasedOnOrderType(String? reservationId){
    String orderNumber = '$orderNo ${order.no!.toUpperCase()}';
    if(order.reservationId!=null) {
      return '$orderNumber $lp$menuOnsiteLowerCase$rp';
    }

    return '$orderNumber $lp$menuTakeawayLowerCase$rp';
  }

  Widget? _setRemarks(BuildContext context, String remarks){
    if(remarks!=StringUtil.EMPTY) {
      return RichText(
              text: TextSpan(
                text: '$note ',
                children: <InlineSpan>[
                  TextSpan(
                      text: remarks,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.red)),
                ],
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            );
    }

    return null;
  }

  _translateStatus(String status) {
    if (status == OrderStatus.pending.name) {
      return orderStatusPending;
    }  else if (status == OrderStatus.cancelled.name) {
      return orderStatusCancelled;
    } else if (status == OrderStatus.confirmed.name) {
      return orderStatusConfirmed;
    } else if (status == OrderStatus.ready.name) {
      return orderStatusReady;
    }
  }

  _setColorBasedOnStatus(String status) {
    if (status == OrderStatus.pending.name) {
      return Colors.black;
    }  else if (status == OrderStatus.cancelled.name) {
      return Colors.red;
    } else if (status == OrderStatus.confirmed.name) {
      return Colors.black;
    } else if (status == OrderStatus.ready.name) {
      return Colors.green;
    }
  }
}
