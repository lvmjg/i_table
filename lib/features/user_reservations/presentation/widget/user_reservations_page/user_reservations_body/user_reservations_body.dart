import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widget/common_failure.dart';
import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/common_loading.dart';
import '../../../../../../core/widget/reservation_card_basic_details.dart';
import '../../../bloc/user_reservations_bloc.dart';
import '../../reservation_details_page/reservation_details_page.dart';

class UserReservationsBody extends StatelessWidget {
  const UserReservationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<UserReservationsBloc, UserReservationsState>(
      builder: (context, state) {
        if (state is UserReservationsFetchFailure) {
          return CommonFailure(
              onPressed: () {}
          );
        }
        else if (state is UserReservationsFetchSuccess) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: state.userReservations.length,
                    itemBuilder: (context, index) {

                      return Hero(
                          tag: 'item$index',
                          child: ReservationCardBasicDetails(placeReservation: state.userReservations[index], buttonsEnabled: true, onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ReservationDetailsPage(placeName: state.userReservations[index].placeName, index: index),
                            ));
                          })
                      );
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
