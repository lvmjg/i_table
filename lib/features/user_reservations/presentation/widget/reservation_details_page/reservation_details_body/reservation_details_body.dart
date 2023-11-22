import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/globals.dart';

import '../../../../../../core/widget/common_failure.dart';
import '../../../../../../core/widget/reservation_card_basic_details.dart';
import '../../../../../../core/widget/reservation_card_billing.dart';
import '../../../../../../core/widget/reservation_card_sittings.dart';
import '../../../bloc/user_reservations_bloc.dart';

class ReservationDetailsBody extends StatelessWidget {
  final int index;

  const ReservationDetailsBody({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserReservationsBloc, UserReservationsState>(
      builder: (context, state) {
        if (state is UserReservationsFetchSuccess) {
          return Column(
            children: [
              Hero(
                  tag: 'item${index}',
                  child: ReservationCardBasicDetails(
                      placeReservation: state.reservations[index],
                      buttonsEnabled: true,
                      onPressed: () {})),
              ReservationCardSittings(
                  placeReservation: state.reservations[index]),
              ReservationCardBilling()
            ],
          );
        }
        return Container();
      },
    );
  }
}
