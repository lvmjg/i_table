import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widget/common_failure.dart';
import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/common_loading.dart';
import '../../../../../../core/widget/service_order_card.dart';
import '../../../bloc/service_orders_bloc.dart';

class ServiceOrdersBody extends StatelessWidget {
  const ServiceOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceOrdersBloc, ServiceOrdersState>(
      builder: (context, state) {
        if (state is ServiceOrdersFetchFailure) {
          return CommonFailure(onPressed: () {});
        } else if (state is ServiceOrdersFetchSuccess) {
          return Column(
            children: [
              Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      children: state.orders
                          .map((e) => ServiceOrderCard(order: e))
                          .toList())),
            ],
          );
        }

        return const CommonLoading();
      },
    );
  }
}
