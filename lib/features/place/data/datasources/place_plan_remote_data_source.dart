import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../../domain/entities/place_plan/place_plan_level_entity.dart';

abstract class PlacePlanRemoteDataSource {
  Future<List<PlacePlanLevelEntity>> fetchPlacePlan(
      String placeId);
}

class PlacePlanRemoteDataSourceImpl
    implements PlacePlanRemoteDataSource {
  @override
  Future<List<PlacePlanLevelEntity>> fetchPlacePlan(
      String placeId) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    try {
      FirebaseFirestore ff = FirebaseFirestore.instance;

      QuerySnapshot<Map<String, dynamic>> placesPlansSnapshot = await ff
          .collection(pathPlacesPlans)
          .where(pathPlaceId, isEqualTo: placeId)
          .get();

      List<PlacePlanLevelEntity> placeLevels = [];

      if (placesPlansSnapshot.docs.isNotEmpty) {
        String planDocumentId = placesPlansSnapshot.docs.first.id;

        QuerySnapshot<Map<String, dynamic>> placePlanLevelsSnapshot =
            await ff
                .collection(pathPlacesPlans)
                .doc(planDocumentId)
                .collection(pathPlacePlanLevels)
                .get();

        placeLevels = placePlanLevelsSnapshot.docs
            .map((value) =>
                PlacePlanLevelEntity.fromJson(value.id, value.data()))
            .toList();
      }

      return placeLevels;
    } catch (e, s) {
      throw FetchException();
    }
  }
}
