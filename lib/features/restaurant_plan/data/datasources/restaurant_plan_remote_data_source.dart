import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../../domain/entities/restaurant_plan/restaurant_plan_level_entity.dart';

abstract class RestaurantPlanRemoteDataSource {
  Future<List<RestaurantPlanLevelEntity>> fetchRestaurantPlan(
      String restaurantId);
}

class RestaurantPlanRemoteDataSourceImpl
    implements RestaurantPlanRemoteDataSource {
  @override
  Future<List<RestaurantPlanLevelEntity>> fetchRestaurantPlan(
      String restaurantId) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    try {
      FirebaseFirestore ff = FirebaseFirestore.instance;

      QuerySnapshot<Map<String, dynamic>> restaurantsPlansSnapshot = await ff
          .collection(RESTAURANTS_PLANS)
          .where(RESTAURANT_ID, isEqualTo: restaurantId)
          .get();

      List<RestaurantPlanLevelEntity> restaurantLevels = [];

      if (restaurantsPlansSnapshot.docs.isNotEmpty) {
        String planDocumentId = restaurantsPlansSnapshot.docs.first.id;

        QuerySnapshot<Map<String, dynamic>> restaurantPlanLevelsSnapshot =
            await ff
                .collection(RESTAURANTS_PLANS)
                .doc(planDocumentId)
                .collection(RESTAURANT_PLAN_LEVELS)
                .get();

        restaurantLevels = restaurantPlanLevelsSnapshot.docs
            .map((value) =>
                RestaurantPlanLevelEntity.fromJson(value.id, value.data()))
            .toList();
      }

      return restaurantLevels;
    } catch (e, s) {
      throw FetchException();
    }
  }
}
