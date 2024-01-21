import 'package:i_table/core/data_source/firebase_data_source.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../../place_plan/data/model/place_reservation/place_reservation_model.dart';

abstract class UserReservationsRemoteDataSource {
  Stream<List<PlaceReservationModel>> fetchUserReservations(UserIdParams params);
  Future<void> updateReservationStatus(ReservationChangeStatusParams params);
}

class UserReservationsRemoteDataSourceImpl
    implements UserReservationsRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Stream<List<PlaceReservationModel>> fetchUserReservations(UserIdParams params) {
    try {
      return fds.fetchReservations(userId: params.userId);
    } catch (e, s) {
      throw FetchException();
    }
  }

  @override
  Future<void> updateReservationStatus(ReservationChangeStatusParams params) async {
    try {
      return await fds.changeStatus(params.reservationId, params.closeStatus, params.closedBy);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
