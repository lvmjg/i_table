import 'package:flutter/material.dart';
import 'package:i_table/core/place_order/domain/entity/place_order.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/core/widget/common_divider.dart';
import 'package:i_table/core/widget/common_card.dart';
import 'package:intl/intl.dart';

import '../util/globals.dart';

class UserOrderCard extends StatelessWidget {
  final PlaceOrder order;

  const UserOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        onPressed: () {},
        outerPadding: padding / 8,
        innerPadding: padding / 3,
        child: Column(
          children: [
            Text(_setCardTitleBasedOnOrderType(order.reservationId),
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
                          text: '${order.totalCost}zł',
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
}
