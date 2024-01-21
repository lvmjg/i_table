import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/user_orders/presentation/widget/user_orders_page/user_orders_app_bar/user_orders_app_bar.dart';
import 'package:i_table/features/user_orders/presentation/widget/user_orders_page/user_orders_body/user_orders_body.dart';

import '../../../../../../core/util/globals.dart';
import '../../../bloc/user_orders_bloc.dart';

class UserAllOrdersBody extends StatefulWidget {
  final String userId;

  const UserAllOrdersBody(
      {Key? key, required this.userId})
      : super(key: key);

  @override
  State<UserAllOrdersBody> createState() => _UserAllOrdersBodyState();
}

class _UserAllOrdersBodyState extends State<UserAllOrdersBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAllOrdersBloc, UserOrdersState>(
        builder: (context, state) {
      return UserOrdersBody(
          userOrReservationId: widget.userId,
          state: state,
          globalBloc: true,
      );

    });
  }
}
