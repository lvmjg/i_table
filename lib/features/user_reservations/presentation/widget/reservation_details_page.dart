import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/reservation_card_basic_details.dart';
import 'package:i_table/core/widget/reservation_card_sittings.dart';
import 'package:i_table/core/widget/simple_button.dart';

import '../../../../core/util/globals.dart';
import '../../../../core/widget/reservation_card_billing.dart';
import '../bloc/user_reservations_bloc.dart';

class ReservationDetailsPage extends StatefulWidget {
  final int index;

  ReservationDetailsPage({Key? key, required this.index}) : super(key: key);

  @override
  State<ReservationDetailsPage> createState() => _ReservationDetailsPageState();
}

class _ReservationDetailsPageState extends State<ReservationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('test'),
      ),
      body: BlocBuilder<UserReservationsBloc, UserReservationsState>(
        builder: (context, state) {
          if (state is UserReservationsFetchSuccess) {
            return Column(
              children: [
                Hero(
                    tag: 'item${widget.index}',
                    child: ReservationCardBasicDetails()
                ),
                ReservationCardSittings(),
                ReservationCardBilling()
              ],
            );

          }
          return Container();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //context.read<UserReservationsBloc>().add(UserReservationsInitiated(userId: loggedUserId));
  }
}
