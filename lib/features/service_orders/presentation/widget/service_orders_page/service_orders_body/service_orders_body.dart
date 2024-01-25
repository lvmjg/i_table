import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:i_table/features/service_orders/presentation/widget/service_orders_page/service_orders_body/service_orders_list.dart';

import '../../../../../../core/place_order/domain/entity/place_orders_factory.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../core/util/snack_bar_util.dart';
import '../../../../data/data_source/service_orders_remote_data_source.dart';
import '../../../../data/repository/service_orders_repository.dart';
import '../../../../domain/usecase/fetch_todays_service_orders.dart';
import '../../../bloc/service_orders_bloc.dart';

enum ServiceOrderFetchType {
  todaysUncompleted,
  todaysCompleted,
  tomorrowsUncompleted,
  tomorrowsCompleted
}

class ServiceOrdersBody extends StatelessWidget {
  const ServiceOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      _createList<ServiceTodaysUncompletedOrdersBloc>(
          ServiceOrderFetchType.todaysUncompleted),
      _createList<ServiceTodaysCompletedOrdersBloc>(
          ServiceOrderFetchType.todaysCompleted),
      _createList<ServiceTomorrowsUncompletedOrdersBloc>(
          ServiceOrderFetchType.tomorrowsUncompleted),
      _createList<ServiceTomorrowsCompletedOrdersBloc>(
          ServiceOrderFetchType.tomorrowsCompleted)
    ]);
  }

  Widget _createList<T extends Bloc<ServiceOrdersEvent, ServiceOrdersState>>(
      ServiceOrderFetchType type) {
    return BlocConsumer<T, ServiceOrdersState>(
      buildWhen: (previous, current) =>
          current is! ServiceOrderUpdateStatusFailure,
      listener: (context, state) {
        if (state is ServiceOrderUpdateStatusFailure) {
          SnackBarUtil.showSnackBar(context, state.failure);
        }
      },
      builder: (context, state) {
        return ServiceOrdersList(type: type, state: state);
      },
    );
  }
}
