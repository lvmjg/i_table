import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widget/common_failure.dart';
import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/common_loading.dart';
import '../../../../../../core/widget/user_order_card.dart';
import '../../../bloc/user_orders_bloc.dart';

class UserOrdersBody extends StatelessWidget {
  const UserOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserOrdersBloc, UserOrdersState>(
      builder: (context, state) {
        if (state is UserOrdersFetchFailure) {
          return CommonFailure(onPressed: () {});
        } else if (state is UserOrdersFetchSuccess) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      return UserOrderCard(order: state.orders[index]);
                    }),
              ),
            ],
          );
        }

        return const CommonLoading();
      },
    );
  }
}
