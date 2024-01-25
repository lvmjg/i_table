import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/place_order/data/model/order_status.dart';
import 'package:i_table/core/usecase/usecase.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/core/widget/common_checkbox.dart';
import 'package:i_table/core/widget/common_divider.dart';
import 'package:i_table/core/widget/common_card.dart';
import 'package:i_table/core/widget/simple_filled_tonal_button.dart';
import 'package:i_table/features/service_orders/presentation/bloc/service_orders_bloc.dart';
import 'package:i_table/features/service_orders/presentation/widget/service_orders_page/service_orders_body/service_orders_body.dart';
import 'package:intl/intl.dart';

import '../place_order/domain/entity/place_order.dart';
import '../util/globals.dart';

class ServiceOrderCard extends StatelessWidget {
  final PlaceOrder order;
  final ServiceOrderFetchType type;

  const ServiceOrderCard({Key? key, required this.order, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        onPressed: () {},
        outerPadding: EdgeInsets.all(padding / 8),
        innerPadding: EdgeInsets.all(padding / 3),
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
                  Text(DateFormat('dd.MM.yyyy HH:mm').format(order.createDate),
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
                        Visibility(
                            visible: _showOrderCheckboxes(order.status),
                            child: CommonCheckbox(
                        initialValue: order.userOrders[index].status,
                          onValueFalse: () => order.userOrders[index].status = false,
                          onValueTrue: () => order.userOrders[index].status = true,
                        )
                        )
                      ],
                    ),
                  );
                }),
            Offstage(
                offstage: _hideBottomDivider(order.status),
                child: CommonDivider()
            ),
    Offstage(
    offstage: _hideOrderCheckboxes(order.status),
           child: Align(
              alignment: Alignment.center,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(completed,
                      style: Theme.of(context).textTheme.bodyMedium),
                  Checkbox(value: order.status==OrderStatus.ready.name, onChanged: (value) {
                    value = value ?? false;
                    if(value){
                      _readyOrder(context, type, order.id ?? StringUtil.EMPTY);
                    }
                    else{
                      _confirmOrder(context, type, order.id ?? StringUtil.EMPTY);
                    }
                  })
                ],
              ),

            ),
    ),
            Offstage(
              offstage: _hideConfirmationButtons(order.status),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SimpleFilledTonalButton(
                      title: discard,
                      iconData: Icons.close_rounded,
                      iconColor: Colors.red,
                      onPressed: () => _discardOrder(context, type, order.id ?? StringUtil.EMPTY)
                  ),
                  SimpleFilledTonalButton(
                      title: confirm,
                      iconData: Icons.done_rounded,
                      iconColor: Colors.green,
                      onPressed: () => _confirmOrder(context, type, order.id ?? StringUtil.EMPTY)
                  )
                ],
              ),
            )
          ],
        ));
  }

  void _discardOrder(BuildContext context, ServiceOrderFetchType type, String orderId){
    _updateOrderStatus(context, type, orderId, 'cancelled');
  }

  void _confirmOrder(BuildContext context, ServiceOrderFetchType type, String orderId){
    _updateOrderStatus(context, type, orderId, 'confirmed');
  }

  void _readyOrder(BuildContext context, ServiceOrderFetchType type, String orderId){
    _updateOrderStatus(context, type, orderId, 'ready');
  }

  void _updateOrderStatus(BuildContext context, ServiceOrderFetchType type, String orderId, String newStatus){
    if(type==ServiceOrderFetchType.todaysUncompleted){
      context
          .read<ServiceTodaysUncompletedOrdersBloc>()
          .add(ServiceOrderUpdateStatus(params: OrderUpdateStatusParams(orderId: orderId, newStatus: newStatus)));
    }
    else if(type==ServiceOrderFetchType.todaysCompleted){
      context
          .read<ServiceTodaysCompletedOrdersBloc>()
          .add(ServiceOrderUpdateStatus(params: OrderUpdateStatusParams(orderId: orderId, newStatus: newStatus)));
    }
    else if(type==ServiceOrderFetchType.tomorrowsUncompleted){
      context
          .read<ServiceTomorrowsUncompletedOrdersBloc>()
          .add(ServiceOrderUpdateStatus(params: OrderUpdateStatusParams(orderId: orderId, newStatus: newStatus)));
    }
  }

  bool _hideBottomDivider(String status){
    return status==OrderStatus.cancelled.name;
  }

  bool _hideConfirmationButtons(String status){
    return status!=OrderStatus.pending.name;
  }

  bool _showOrderCheckboxes(String status){
    return status==OrderStatus.confirmed.name || status==OrderStatus.ready.name;
  }

  bool _hideOrderCheckboxes(String status){
    return !_showOrderCheckboxes(status);
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
      return Colors.blueGrey;
    }  else if (status == OrderStatus.cancelled.name) {
      return Colors.red;
    } else if (status == OrderStatus.confirmed.name) {
      return Colors.green;
    } else if (status == OrderStatus.ready.name) {
      return primaryColor;
    }
  }
}
