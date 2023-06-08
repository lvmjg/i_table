import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_details_entity.dart';

import '../../../../core/util/globals.dart';

class RestaurantDetailsRepository{

  Map<String, RestaurantDetailsEntity> cachedRestaurantsDetails = {};

  Future<RestaurantDetailsEntity?> fetchRestaurantDetails(String restaurantId) async{

    RestaurantDetailsEntity? cachedRestaurantDetails = cachedRestaurantsDetails[restaurantId];
    if(cachedRestaurantDetails != null){
      return cachedRestaurantDetails;
    }

    FirebaseFirestore ff = FirebaseFirestore.instance;

    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    QuerySnapshot<Map<String, dynamic>> restaurantDetailsSnapshot = await ff
        .collection('restaurantsDetails').where('restaurantId', isEqualTo: restaurantId).get();

    RestaurantDetailsEntity fetchedRestaurantDetails = restaurantDetailsSnapshot.docs.map((value) =>
        RestaurantDetailsEntity.fromJson(value.data())).toList().first;

    cachedRestaurantsDetails[restaurantId] = fetchedRestaurantDetails;

    return fetchedRestaurantDetails;
  }

}