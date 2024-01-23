import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/place_plan/domain/entity/place_reservation/place_reservation.dart';

import '../../../../../../core/util/snack_bar_util.dart';
import '../../../../../../core/widget/common_failure.dart';
import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/common_loading.dart';
import '../../../../../../core/widget/reservation_card_basic_details.dart';
import '../../../bloc/user_reservations_bloc.dart';
import '../../reservation_details_page/reservation_details_page.dart';

class UserReservationsBody extends StatefulWidget {
  const UserReservationsBody({super.key});

  @override
  State<UserReservationsBody> createState() => _UserReservationsBodyState();
}

class _UserReservationsBodyState extends State<UserReservationsBody> {
  @override
  void initState() {
    super.initState();
    context
        .read<UserReservationsBloc>()
        .add(UserReservationsInitiated(userId: loggedUserId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserReservationsBloc, UserReservationsState>(
      buildWhen: (previous, current) => current is! UserReservationsUpdateStatusFailure,
      listener: (context, state) {
        if (state is UserReservationsUpdateStatusFailure) {
          SnackBarUtil.showSnackBar(context, state.failure);
        }
      },
      builder: (context, state) {
        if (state is UserReservationsFetchFailure) {
          return CommonFailure(onPressed: () {});
        }

        if (state is UserReservationsFetchSuccess) {
          return _displayReservations(state.reservations, state.inTouchMode);
        }

        return const CommonLoading();
      },
    );
  }

  Widget _displayReservations(
      List<PlaceReservation> reservations, bool inTouchMode) {
    if (reservations.isEmpty) {
      return _displayNoReservationsText();
    } else {
      return _displayReservationList(reservations, inTouchMode);
    }
  }

  Widget _displayNoReservationsText() {
    return Center(
        child: Text(noReservations,
            style: Theme.of(context).textTheme.headlineMedium));
  }

  Widget _displayReservationList(
      List<PlaceReservation> reservations, bool inTouchMode) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: reservations.length,
              itemBuilder: (context, index) {
                return Hero(
                    tag: 'item$index',
                    child: ReservationCardBasicDetails(
                        placeReservation: reservations[index],
                        buttonsEnabled: true,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ReservationDetailsPage(
                                placeName: reservations[index].placeName,
                                index: index),
                          ));
                        }));
              }),
        ),
      ],
    );
  }
}
