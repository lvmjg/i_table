import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_details_entity.dart';

class RestaurantDetailsUseCase{

  Map<String, RestaurantDetailsEntity> cachedRestaurantsDetails = {};

  RestaurantDetailsEntity? fetchedRestaurantDetails;

  Future<RestaurantDetailsEntity?> fetchRestaurantDetails(String restaurantId) async{

    RestaurantDetailsEntity? cachedRestaurantDetails = cachedRestaurantsDetails[restaurantId];
    if(cachedRestaurantDetails != null){
      return cachedRestaurantDetails;
    }

    FirebaseFirestore ff = FirebaseFirestore.instance;

    await Future.delayed(Duration(seconds: 1));

    QuerySnapshot<Map<String, dynamic>> restaurantDetailsSnapshot = await ff
          .collection('restaurantsDetails').where('restaurantId', isEqualTo: restaurantId).get();

    print('test');

    fetchedRestaurantDetails = restaurantDetailsSnapshot.docs.map((value) =>
        RestaurantDetailsEntity(
             restaurantName: value['restaurantName'],
             restaurantAddress: value['restaurantName'])).toList().first;
      /* = RestaurantDetailsEntity
        (restaurantName: restaurantDetailsSnapshot['restaurantName'],
              restaurantAddress: restaurantDetailsSnapshot['restaurantDescription']);*/

    return fetchedRestaurantDetails;
  }

}