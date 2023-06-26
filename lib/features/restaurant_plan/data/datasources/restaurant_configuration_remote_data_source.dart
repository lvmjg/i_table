import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../../domain/entities/restaurant_configuration/restaurant_configuration_entity.dart';

abstract class RestaurantConfigurationRemoteDataSource {
  Future<RestaurantConfigurationEntity?> fetchRestaurantConfiguration(
      String restaurantId);
}

class RestaurantConfigurationRemoteDataSourceImpl
    implements RestaurantConfigurationRemoteDataSource {
  @override
  Future<RestaurantConfigurationEntity?> fetchRestaurantConfiguration(
      String restaurantId) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    try {
      FirebaseFirestore ff = FirebaseFirestore.instance;

      QuerySnapshot<Map<String, dynamic>> restaurantsConfigurationsSnapshot =
          await ff
              .collection(RESTAURANTS_CONFIGURATIONS)
              .where(RESTAURANT_ID, isEqualTo: restaurantId)
              .get();

      RestaurantConfigurationEntity? restaurantConfiguration = null;
      if (restaurantsConfigurationsSnapshot.docs.isNotEmpty) {
        QueryDocumentSnapshot<Map<String, dynamic>> firstDocument =
            restaurantsConfigurationsSnapshot.docs.first;

        restaurantConfiguration = RestaurantConfigurationEntity.fromJson(
            firstDocument.id, firstDocument.data());
      }

      return restaurantConfiguration;
    } catch (e, s) {
      throw FetchException();
    }
  }
}
