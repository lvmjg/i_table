import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/user_reservations/domain/usecase/update_user_reservation_status.dart';
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
  UserReservationsRepository repository = UserReservationsRepositoryImpl(UserReservationsRemoteDataSourceImpl(),
      PlaceReservationsFactory());

  Stream<List<PlaceReservation>>? userReservationsStream;

  UserReservationsBloc() : super(UserReservationsFetchInProgress()) {
    FetchUserReservations fetchUserReservations = FetchUserReservations(repository);
    UpdateUserReservationStatus updateReservationStatus = UpdateUserReservationStatus(repository);

    on<UserReservationsInitiated>((event, emit) async {
      emit(UserReservationsFetchInProgress());

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      fetchUserReservations(UserIdParams(userId: event.userId)).fold(
          (failure) => emit(UserReservationsFetchFailure(
              params: ErrorParams(errorMessage: errorFetchData))),
          (newUserReservationsStream) =>
              userReservationsStream = newUserReservationsStream);

      await _handleStream(emit);
    }, transformer: restartable());

    on<UserReservationsUpdateStatus>((event, emit) async {
      emit(UserReservationsFetchSuccess(reservations: repository.reservations, inTouchMode: false));

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      Either result = await updateReservationStatus(event.params);
      if(result.isLeft()){
        emit(UserReservationsUpdateStatusFailure(failure: errorUpdateReservationStatus));
        emit(UserReservationsFetchSuccess(reservations: repository.reservations, inTouchMode: true));
      }
    }, transformer: restartable());
  }

  Future<void> _handleStream(Emitter<UserReservationsState> emit) async {
    if (userReservationsStream != null) {
      await emit.forEach(userReservationsStream!,
          onData: (List<PlaceReservation> userReservations) {
            userReservations
                .sort((a, b) => a.startDate.compareTo(b.startDate) * -1);
            return UserReservationsFetchSuccess(reservations: userReservations, inTouchMode: true);
          },
          onError: (e, s){
            return UserReservationsFetchFailure(
                params: ErrorParams(errorMessage: errorFetchData));
          }
      );
    }
  }
}
