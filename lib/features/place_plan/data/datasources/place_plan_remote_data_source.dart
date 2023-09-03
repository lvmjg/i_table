import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../models/place_plan/place_plan_level_model.dart';

abstract class PlacePlanRemoteDataSource {
  Future<List<PlacePlanLevelModel>> fetchPlacePlan(
      String placeId);
}

class PlacePlanRemoteDataSourceImpl
    implements PlacePlanRemoteDataSource {
  @override
  Future<List<PlacePlanLevelModel>> fetchPlacePlan(
      String placeId) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    try {
      FirebaseFirestore ff = FirebaseFirestore.instance;

      QuerySnapshot<Map<String, dynamic>> placesPlansSnapshot = await ff
          .collection(pathPlacesPlans)
          .where(pathPlaceId, isEqualTo: placeId)
          .get();

      List<PlacePlanLevelModel> placeLevels = [];

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
            PlacePlanLevelModel.fromJson(value.data()))
            .toList();
      }

      return placeLevels;
    } catch (e, s) {
      throw FetchException();
    }
  }
}
