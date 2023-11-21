import 'package:i_table/core/data_source/firebase_data_source.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/extension/extension.dart';

import '../model/place_reservation/place_reservation_model.dart';

abstract class PlaceReservationsRemoteDataSource {
  Stream<List<PlaceReservationModel>> fetchPlaceReservations(
      String placeId, DateTime reservationDate);
}

class PlaceReservationsRemoteDataSourceImpl
    implements PlaceReservationsRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Stream<List<PlaceReservationModel>> fetchPlaceReservations(
      String placeId, DateTime reservationDate) {
    try {
      return fds.fetchReservations(
          placeId: placeId, reservationDate: reservationDate.onlyDate());
    } catch (e, s) {
      throw FetchException();
    }
  }
}
