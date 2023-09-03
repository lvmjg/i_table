import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/user_reservations/domain/usecase/fetch_user_reservations.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../place_plan/domain/entities/place_reservation/place_reservation.dart';
import '../../../place_plan/domain/entities/place_reservation/place_reservations_factory.dart';
import '../../data/datasources/user_reservations_remote_data_source.dart';
import '../../data/repositories/user_reservations_repository.dart';

part 'user_reservations_event.dart';

part 'user_reservations_state.dart';

class UserReservationsBloc
    extends Bloc<UserReservationsEvent, UserReservationsState> {
  UserReservationsBloc() : super(UserReservationsFetchInProgress()) {
    FetchUserReservations fetchUserReservations = FetchUserReservations(
        UserReservationsRepositoryImpl(UserReservationsRemoteDataSourceImpl(),
            PlaceReservationsFactory()));

    on<UserReservationsInitiated>((event, emit) async {
      emit(UserReservationsFetchInProgress());

      if (state is UserReservationsFetchInProgress) {
        (await fetchUserReservations(UserIdParams(userId: event.userId))).fold(
            (failure) => emit(UserReservationsFetchFailure(
                errorMessage: errorFetchUserReservations)),
            (userReservations) => emit(UserReservationsFetchSuccess(
                userReservations: userReservations)));
      }
    });
  }
}
