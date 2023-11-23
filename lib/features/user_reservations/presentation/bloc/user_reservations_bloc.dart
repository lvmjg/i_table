import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/user_reservations/domain/usecase/fetch_user_reservations.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/widget/common_page.dart';
import '../../../place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../../../place_plan/domain/entity/place_reservation/place_reservations_factory.dart';
import '../../data/data_source/user_reservations_remote_data_source.dart';
import '../../data/repository/user_reservations_repository.dart';

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

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      Stream<List<PlaceReservation>>? userReservationsStream;

      fetchUserReservations(UserIdParams(userId: event.userId)).fold(
          (failure) => emit(UserReservationsFetchFailure(
              params: ErrorParams(errorMessage: errorFetchUserReservations))),
          (newUserReservationsStream) =>
              userReservationsStream = newUserReservationsStream);

      if (userReservationsStream != null) {
        await emit.forEach(userReservationsStream!,
            onData: (List<PlaceReservation> userReservations) {
          userReservations
              .sort((a, b) => a.startDate.compareTo(b.startDate) * -1);
          return UserReservationsFetchSuccess(reservations: userReservations);
        });
      }
    }, transformer: restartable());
  }
}
