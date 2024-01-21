import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/place_order/domain/entity/place_order.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/common_failure.dart';
import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/common_loading.dart';
import '../../../../../../core/widget/user_order_card.dart';
import '../../../bloc/user_orders_bloc.dart';

class UserOrdersBody extends StatefulWidget {
  final bool globalBloc;
  final UserOrdersState state;
  final String userOrReservationId;

  UserOrdersBody(
      {super.key,
      required this.state,
      required this.userOrReservationId,
      required this.globalBloc});

  @override
  State<UserOrdersBody> createState() => _UserOrdersBodyState();
}

class _UserOrdersBodyState extends State<UserOrdersBody> {
  @override
  Widget build(BuildContext context) {
    if (widget.state is UserOrdersFetchFailure) {
      return CommonFailure(onPressed: () => _initBloc(true));
    }

    if (widget.state is UserOrdersFetchSuccess) {
      return _displayOrders((widget.state as UserOrdersFetchSuccess).orders);
    }

    return const CommonLoading();
  }

  Widget _displayOrders(List<PlaceOrder> orders) {
    if (orders.isEmpty) {
      return _displayNoOrdersText();
    } else {
      return _displayOrderList(orders);
    }
  }

  Widget _displayNoOrdersText() {
    return Center(
        child:
            Text(noOrders, style: Theme.of(context).textTheme.headlineMedium));
  }

  Widget _displayOrderList(List<PlaceOrder> orders) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return UserOrderCard(order: orders[index]);
              }),
        ),
      ],
    );
  }

  @override
  void initState() {
    _initBloc();
  }

  void _initBloc([bool force = false]){
    if (widget.globalBloc) {
      if (testbloc == false || force) {
        log('Orders initiated for globalBloc');

        context.read<UserAllOrdersBloc>().add(UserOrdersInitiated(
            userOrReservationId: widget.userOrReservationId));

        testbloc = true;
      }
    } else {
      log('Orders initiated for localBloc');

      context.read<UserReservationOrdersBloc>().add(
          UserOrdersInitiated(userOrReservationId: widget.userOrReservationId));
    }
  }
}
