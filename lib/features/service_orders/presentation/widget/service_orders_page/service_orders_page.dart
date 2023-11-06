import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/usecase/usecase.dart';
import 'package:i_table/features/service_orders/presentation/widget/service_orders_page/service_orders_app_bar/service_orders_app_bar.dart';
import 'package:i_table/features/service_orders/presentation/widget/service_orders_page/service_orders_body/service_orders_body.dart';

import '../../../../../core/util/globals.dart';
import '../../bloc/service_orders_bloc.dart';

class ServiceOrdersPage extends StatefulWidget {
  const ServiceOrdersPage({Key? key}) : super(key: key);

  @override
  State<ServiceOrdersPage> createState() => _ServiceOrdersPageState();
}

class _ServiceOrdersPageState extends State<ServiceOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ServiceOrdersAppBar(title: kitchen),
        body: const ServiceOrdersBody());
  }

  @override
  void initState() {
    super.initState();
    context
        .read<ServiceOrdersBloc>()
        .add(ServiceOrdersInitiated(params: PlaceIdParams(placeId: '9wtiLFlRdZ1b8abbPoet')));
  }
}
