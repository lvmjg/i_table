import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_details_entity.dart';

class RestaurantDetailsUseCase{

  RestaurantDetailsEntity? fetchedRestaurantDetails;

  Future<RestaurantDetailsEntity?> fetchRestaurantDetails(String restaurantId) async{

    if(fetchedRestaurantDetails == null) {
      FirebaseFirestore ff = FirebaseFirestore.instance;

      await Future.delayed(Duration(seconds: 3));
      DocumentSnapshot<Map<String, dynamic>> restaurantDetailsSnapshot = await ff
          .collection('restaurantsDetails').doc(restaurantId).get();

      fetchedRestaurantDetails = RestaurantDetailsEntity
        (restaurantName: restaurantDetailsSnapshot['restaurantName'],
              restaurantAddress: restaurantDetailsSnapshot['restaurantDescription']);
    }

    return fetchedRestaurantDetails;
  }

}