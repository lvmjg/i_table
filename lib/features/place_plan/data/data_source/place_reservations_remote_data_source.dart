import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/extension/extension.dart';

import '../../../../core/util/globals.dart';
import '../model/place_reservation/place_reservation_model.dart';

abstract class PlaceReservationsRemoteDataSource {
  Future<List<PlaceReservationModel>> fetchPlaceReservations(
      String placeId, DateTime reservationDate);
}

class PlaceReservationsRemoteDataSourceImpl
    implements PlaceReservationsRemoteDataSource {
  @override
  Future<List<PlaceReservationModel>> fetchPlaceReservations(
      String placeId, DateTime reservationDate) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    reservationDate = reservationDate.onlyDate();

    List<PlaceReservationModel> placesReservationsModel = [];
    try {
      FirebaseFirestore ff = FirebaseFirestore.instance;

     QuerySnapshot<Map<String, dynamic>> placesReservationsSnapshot =
     await ff
              .collection(pathPlacesReservations)
              .where(pathPlaceId, isEqualTo: placeId)
              .where(pathStartDate, isGreaterThanOrEqualTo: reservationDate)
              .where(pathStartDate, isLessThan: reservationDate.add(const Duration(days: 1)))
              .get(const GetOptions(source: Source.server));

      placesReservationsModel= placesReservationsSnapshot.docs.map((value) => PlaceReservationModel.fromJson(value.id, value.data())).toList();

      return placesReservationsModel;
    } catch (e, s) {
      throw FetchException();
    }
  }
}
