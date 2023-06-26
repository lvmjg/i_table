import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../../domain/entities/reservation/reservation_entity.dart';

abstract class RestaurantReservationsRemoteDataSource {
  Future<List<ReservationEntity>> fetchRestaurantReservations(
      String restaurantId, DateTime start, DateTime end);
}

class RestaurantReservationsRemoteDataSourceImpl
    implements RestaurantReservationsRemoteDataSource {
  @override
  Future<List<ReservationEntity>> fetchRestaurantReservations(
      String restaurantId, DateTime start, DateTime end) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    try {
      FirebaseFirestore ff = FirebaseFirestore.instance;

      QuerySnapshot<Map<String, dynamic>> restaurantsReservationsSnapshot =
          await ff
              .collection(RESTAURANTS_RESERVATIONS)
              .where(RESTAURANT_ID, isEqualTo: restaurantId)
              .where(RESERVATION_START, isGreaterThanOrEqualTo: start)
              .where(RESERVATION_END, isLessThanOrEqualTo: end)
              .get();

      List<ReservationEntity> restaurantReservations = [];

      if (restaurantsReservationsSnapshot.docs.isNotEmpty) {
        restaurantReservations = restaurantsReservationsSnapshot.docs
            .map((value) => ReservationEntity.fromJson(value.data()))
            .toList();
      }

      return restaurantReservations;
    } catch (e, s) {
      throw FetchException();
    }
  }
}
