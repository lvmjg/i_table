import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../../domain/entities/place_reservation/place_reservation_entity.dart';

abstract class PlaceReservationsRemoteDataSource {
  Future<List<PlaceReservationEntity>> fetchPlaceReservations(
      String placeId, DateTime start, DateTime end);
}

class PlaceReservationsRemoteDataSourceImpl
    implements PlaceReservationsRemoteDataSource {
  @override
  Future<List<PlaceReservationEntity>> fetchPlaceReservations(
      String placeId, DateTime start, DateTime end) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    try {
      FirebaseFirestore ff = FirebaseFirestore.instance;

      QuerySnapshot<Map<String, dynamic>> placesReservationsSnapshot =
          await ff
              .collection(pathPlacesReservations)
              .where(pathPlaceId, isEqualTo: placeId)
              .where(pathReservationStart, isGreaterThanOrEqualTo: start)
             // .where(pathReservationEnd, isLessThanOrEqualTo: end)
              .get();

      List<PlaceReservationEntity> placeReservations = [];

      if (placesReservationsSnapshot.docs.isNotEmpty) {
        placeReservations = placesReservationsSnapshot.docs
            .map((value) => PlaceReservationEntity.fromJson(value.data()))
            .toList();
      }

      return placeReservations;
    } catch (e, s) {
      throw FetchException();
    }
  }
}
