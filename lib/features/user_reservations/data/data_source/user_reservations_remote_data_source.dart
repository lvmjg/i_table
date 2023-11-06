import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../../../place_plan/data/model/place_reservation/place_reservation_model.dart';

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
          .get(const GetOptions(source: Source.server));

      userReservations = userReservationsSnapshot.docs
          .map(
              (value) => PlaceReservationModel.fromJson(value.id, value.data()))
          .toList();
    } catch (e, s) {
      throw FetchException();
    }

    return userReservations;
  }
}
