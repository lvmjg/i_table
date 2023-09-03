import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../models/place_reservation/place_reservation_model.dart';

abstract class PlaceReservationsRemoteDataSource {
  Stream<List<PlaceReservationModel>> fetchPlaceReservations(
      String placeId, DateTime start);
}

class PlaceReservationsRemoteDataSourceImpl
    implements PlaceReservationsRemoteDataSource {
  @override
  Stream<List<PlaceReservationModel>> fetchPlaceReservations(
      String placeId, DateTime start) async* {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    try {
      FirebaseFirestore ff = FirebaseFirestore.instance;

   /*   ff
          .collection(pathPlacesReservations)
          .where(pathPlaceId, isEqualTo: placeId)
          .where(pathStartDate, isGreaterThanOrEqualTo: start)
          .where(pathStartDate, isLessThan: start.add(const Duration(days: 1))).snapshots(
      ).*/


      Stream<QuerySnapshot<Map<String, dynamic>>> placesReservationsSnapshotStream =
         ff
              .collection(pathPlacesReservations)
              .where(pathPlaceId, isEqualTo: placeId)
              .where(pathStartDate, isGreaterThanOrEqualTo: start)
              .where(pathStartDate, isLessThan: start.add(const Duration(days: 1))).snapshots();

      //can stream snapshot.docs be empty have null??
      placesReservationsSnapshotStream.map((snapshot) => snapshot.docs
          .map((value) => PlaceReservationModel.fromJson(value.data()))
          .toList());

    } catch (e, s) {
      throw FetchException();
    }
  }
}
