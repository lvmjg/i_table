import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/user_orders/presentation/widget/user_orders_page/user_orders_app_bar/user_orders_app_bar.dart';
import 'package:i_table/features/user_orders/presentation/widget/user_orders_page/user_orders_body/user_orders_body.dart';

import '../../../../../core/place_order/domain/entity/place_orders_factory.dart';
import '../../../../../core/util/globals.dart';
import '../../../../../core/widget/common_page.dart';
import '../../../data/data_source/user_orders_remote_data_source.dart';
import '../../../data/repository/user_orders_repository.dart';
import '../../../domain/usecase/fetch_user_orders.dart';
import '../../bloc/user_orders_bloc.dart';

class UserReservationOrdersPage extends StatefulWidget {
  final String reservationId;

  const UserReservationOrdersPage({Key? key, required this.reservationId})
      : super(key: key);

  @override
  State<UserReservationOrdersPage> createState() =>
      _UserReservationOrdersPageState();
}

class _UserReservationOrdersPageState extends State<UserReservationOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserReservationOrdersBloc>(
      create: (context) =>    UserOrdersBloc(
          fetchUserOrders: FetchUserOrders(
              UserReservationOrdersRepository(
                  UserReservationOrdersRemoteDataSource(),
                  PlaceOrdersFactory()))),
      child: CommonPage(
        //bloc: context.read<UserReservationOrdersBloc>(),
        child: Scaffold(
            appBar: UserOrdersAppBar(title: '$orders $lp${widget.reservationId.substring(0, 6)}$rp'),
            body: BlocBuilder<UserReservationOrdersBloc, UserOrdersState>(
              builder: (context, state) {
                return UserOrdersBody(
                  userOrReservationId: widget.reservationId,
                  state: state,
                  globalBloc: false,
                );
              },
            ),
        ),
      ),
    );
  }


}
