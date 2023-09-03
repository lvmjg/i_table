import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/features/place_plan/data/models/place_reservation/place_reservation_model.dart';

import '../../../../core/util/globals.dart';

abstract class UserReservationsRemoteDataSource {
  Future<List<PlaceReservationModel>> fetchUserReservations(String userId);
}

class UserReservationsRemoteDataSourceImpl
    implements UserReservationsRemoteDataSource {
  @override
  Future<List<PlaceReservationModel>> fetchUserReservations(
      String userId) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    FirebaseFirestore ff = FirebaseFirestore.instance;

    List<PlaceReservationModel> userReservations;
    try {
      QuerySnapshot<Map<String, dynamic>> userReservationsSnapshot = await ff
          .collection(pathPlacesReservations)
          .where(pathUserId, isEqualTo: userId)
          .get();

      userReservations = userReservationsSnapshot.docs
          .map((value) => PlaceReservationModel.fromJson(value.data()))
          .toList();
    } catch (e, s) {
      throw FetchException();
    }

    return userReservations;
  }
}
