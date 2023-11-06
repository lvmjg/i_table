import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/deafult_app_bar.dart';
import 'package:i_table/core/widget/reservation_card_basic_details.dart';
import 'package:i_table/core/widget/reservation_card_sittings.dart';
import 'package:i_table/core/widget/simple_button.dart';
import 'package:i_table/features/user_reservations/presentation/widget/reservation_details_page/reservation_details_page.dart';
import 'package:i_table/features/user_reservations/presentation/widget/user_reservations_page/user_reservations_app_bar/user_reservations_app_bar.dart';
import 'package:i_table/features/user_reservations/presentation/widget/user_reservations_page/user_reservations_body/user_reservations_body.dart';

import '../../../../../core/util/globals.dart';
import '../../../../../core/widget/reservation_card_billing.dart';
import '../../bloc/user_reservations_bloc.dart';

class UserReservationsPage extends StatefulWidget {
  UserReservationsPage({Key? key}) : super(key: key);

  @override
  State<UserReservationsPage> createState() => _UserReservationsPageState();
}

class _UserReservationsPageState extends State<UserReservationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserReservationsAppBar(title: myReservations),
      body: UserReservationsBody()
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<UserReservationsBloc>().add(UserReservationsInitiated(userId: loggedUserId));
  }
}
