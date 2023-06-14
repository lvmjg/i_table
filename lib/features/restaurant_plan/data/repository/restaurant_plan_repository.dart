import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/features/restaurant_plan/domain/entity/restaurant_configuration/restaurant_configuration_entity.dart';
import 'package:i_table/features/restaurant_plan/domain/entity/restaurant_plan/restaurant_plan_level_entity.dart';

import '../../../../core/util/globals.dart';

class RestaurantPlanRepository{

  Future<RestaurantConfigurationEntity?> fetchConfiguration(String restaurantId) async{
    FirebaseFirestore ff = FirebaseFirestore.instance;

    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    QuerySnapshot<Map<String, dynamic>> restaurantsConfigurationsSnapshot = await ff
        .collection(RESTAURANTS_CONFIGURATIONS).where(RESTAURANT_ID, isEqualTo: restaurantId).get();

    RestaurantConfigurationEntity? restaurantConfiguration = null;
    if(restaurantsConfigurationsSnapshot.docs.isNotEmpty) {
      QueryDocumentSnapshot<Map<String, dynamic>> firstDocument = restaurantsConfigurationsSnapshot.docs.first;

      restaurantConfiguration = RestaurantConfigurationEntity.fromJson(firstDocument.id, firstDocument.data());
    }

    return restaurantConfiguration;
  }

  Future<List<RestaurantPlanLevelEntity>> fetchRestaurantPlan(String restaurantId) async{
    FirebaseFirestore ff = FirebaseFirestore.instance;

    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    QuerySnapshot<Map<String, dynamic>> restaurantsPlansSnapshot = await ff
        .collection(RESTAURANTS_PLANS)
        .where(RESTAURANT_ID, isEqualTo: restaurantId).get();


    List<RestaurantPlanLevelEntity> restaurantLevels = [];

    if(restaurantsPlansSnapshot.docs.isNotEmpty) {
      String planDocumentId = restaurantsPlansSnapshot.docs.first.id;

      QuerySnapshot<Map<String, dynamic>> restaurantPlanLevelsSnapshot = await ff
          .collection(RESTAURANTS_PLANS)
          .doc(planDocumentId)
          .collection(RESTAURANT_PLAN_LEVELS)
          .get();

      restaurantLevels = restaurantPlanLevelsSnapshot.docs.map((value) => RestaurantPlanLevelEntity.fromJson(value.id, value.data())).toList();
    }

    return restaurantLevels;
  }


}