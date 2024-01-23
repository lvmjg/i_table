import 'dart:developer';

import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:i_table/core/place_order/domain/entity/place_order.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/service_orders/presentation/widget/service_orders_page/service_orders_body/service_orders_body.dart';

import '../../../../../../core/widget/common_failure.dart';
import '../../../../../../core/widget/common_loading.dart';
import '../../../../../../core/widget/service_order_card.dart';
import '../../../bloc/service_orders_bloc.dart';

class ServiceOrdersList extends StatefulWidget {
  final ServiceOrderFetchType type;
  final ServiceOrdersState state;

  const ServiceOrdersList({super.key, required this.type, required this.state});

  @override
  State<ServiceOrdersList> createState() => _ServiceOrdersListState();
}

class _ServiceOrdersListState extends State<ServiceOrdersList> {
  @override
  Widget build(BuildContext context) {
    if (widget.state is ServiceOrdersFetchFailure) {
      return CommonFailure(onPressed: () {});
    }

    if (widget.state is ServiceOrdersFetchSuccess) {
      return _displayOrders((widget.state as ServiceOrdersFetchSuccess).orders,
          (widget.state as ServiceOrdersFetchSuccess).inTouchMode);
    }

    return const CommonLoading();
  }

  Widget _displayOrders(List<PlaceOrder> orders, bool inTouchMode) {
    if (orders.isEmpty) {
      return _displayNoOrdersText();
    } else {
      return _displayOrderList(orders, inTouchMode);
    }
  }

  Widget _displayNoOrdersText() {
    return Center(
        child:
            Text(noOrders, style: Theme.of(context).textTheme.headlineMedium));
  }

  Widget _displayOrderList(List<PlaceOrder> orders, bool inTouchMode) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int numberOfColumns = constraints.maxWidth <= 600 ? 1 : 3;
        return Container(
            child: MasonryGridView.count(
          itemCount: (widget.state as ServiceOrdersFetchSuccess).orders.length,
          crossAxisCount: numberOfColumns,
          itemBuilder: (context, index) {
            return ServiceOrderCard(
                order:
                    (widget.state as ServiceOrdersFetchSuccess).orders[index],
                type: widget.type);
          },
        ));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initBloc();
  }

  void _initBloc() {
    if (widget.type == ServiceOrderFetchType.todaysUncompleted) {
      if (testbloc21 == false) {
        log('ServiceOrders initiated for todaysUncompleted bloc');

        testbloc21 = true;

        context
            .read<ServiceTodaysUncompletedOrdersBloc>()
            .add(ServiceOrdersInitiated(placeId: '9wtiLFlRdZ1b8abbPoet'));
      }
    } else if (widget.type == ServiceOrderFetchType.todaysCompleted) {
      if (testbloc22 == false) {
        log('ServiceOrders initiated for todaysCompleted bloc');

        testbloc22 = true;
        context
            .read<ServiceTodaysCompletedOrdersBloc>()
            .add(ServiceOrdersInitiated(placeId: '9wtiLFlRdZ1b8abbPoet'));
      }
    } else if (widget.type == ServiceOrderFetchType.tomorrowsUncompleted) {
      if (testbloc23 == false) {
        log('ServiceOrders initiated for tomorrowsUncompleted bloc');

        testbloc23 = true;
        context
            .read<ServiceTomorrowsUncompletedOrdersBloc>()
            .add(ServiceOrdersInitiated(placeId: '9wtiLFlRdZ1b8abbPoet'));
      }
    }
  }
}
