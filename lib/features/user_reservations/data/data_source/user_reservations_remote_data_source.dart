import 'package:i_table/core/data_source/firebase_data_source.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../place_plan/data/model/place_reservation/place_reservation_model.dart';

abstract class UserReservationsRemoteDataSource {
  Stream<List<PlaceReservationModel>> fetchUserReservations(String userId);
}

class UserReservationsRemoteDataSourceImpl
    implements UserReservationsRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Stream<List<PlaceReservationModel>> fetchUserReservations(String userId) {
    try {
      return fds.fetchReservations(userId: userId);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
