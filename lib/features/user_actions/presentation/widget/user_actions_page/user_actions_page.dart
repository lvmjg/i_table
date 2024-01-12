import 'package:flutter/material.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/user_actions/presentation/widget/user_actions_page/user_actions_app_bar/user_actions_app_bar.dart';
import 'package:i_table/features/user_actions/presentation/widget/user_actions_page/user_actions_body/user_actions_body.dart';

import '../../../../../core/widget/common_page.dart';

class UserActionsPage extends StatelessWidget {
  const UserActionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CommonPage(
       // bloc: context.read<PlaceMenuBloc>(),
        child: Scaffold(
          appBar: UserActionsAppBar(title: 'Test', categories: [reservations, orders]),
          body: UserActionsBody(categories: [reservations, orders]),
        )
      ),
    );
  }
}
