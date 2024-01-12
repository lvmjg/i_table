import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          return LayoutBuilder(
            builder: (context, constraints) {

              int numberOfColumns = constraints.maxWidth <= 600 ? 1 : 3;
                     return Container(
                       child: MasonryGridView.count(
                         itemCount: state.orders.length,
                            crossAxisCount: numberOfColumns,
                            itemBuilder: (context, index) {
                              return ServiceOrderCard(order: state.orders[index]);
                            },
                     ));
            },
          );
        }

        return const CommonLoading();
      },
    );
  }
}
