import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/user_orders/presentation/widget/user_orders_page/user_orders_app_bar/user_orders_app_bar.dart';
import 'package:i_table/features/user_orders/presentation/widget/user_orders_page/user_orders_body/user_orders_body.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/util/globals.dart';
import '../../bloc/user_orders_bloc.dart';

class UserOrdersPage extends StatefulWidget {
  final String userId;
  final String reservationId;

  const UserOrdersPage({Key? key, required this.userId, required this.reservationId}) : super(key: key);

  @override
  State<UserOrdersPage> createState() => _UserOrdersPageState();
}

class _UserOrdersPageState extends State<UserOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UserOrdersAppBar(title: myOrders),
        body: const UserOrdersBody());
  }

  @override
  void initState() {
    super.initState();
    context
        .read<UserOrdersBloc>()
        .add(UserOrdersInitiated(userId: widget.userId, reservationId: widget.reservationId));
  }
}
