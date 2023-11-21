import 'package:i_table/core/data_source/firebase_data_source.dart';

import '../../../../core/error/exceptions.dart';
import '../../../place_plan/data/model/place_reservation/place_reservation_model.dart';

abstract class ReservationSummaryRemoteDataSource {
  Future<void> submitReservation(PlaceReservationModel placeReservationModel);
}

class ReservationSummaryRemoteDataSourceImpl
    implements ReservationSummaryRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Future<void> submitReservation(
      PlaceReservationModel placeReservationModel) async {
    try {
      await fds.submitReservation(placeReservationModel);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
