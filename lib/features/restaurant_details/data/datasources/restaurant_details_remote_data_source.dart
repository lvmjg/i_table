import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/error/failures.dart';

import '../../../../core/util/globals.dart';
import '../../domain/entity/restaurant_details_entity.dart';

abstract class RestaurantDetailsRemoteDataSource{
  Future<RestaurantDetailsEntity> fetchRestaurantDetails(String restaurantId);
}

class RestaurantDetailsRemoteDataSourceImpl implements RestaurantDetailsRemoteDataSource{

  @override
  Future<RestaurantDetailsEntity> fetchRestaurantDetails(String restaurantId) async{
    FirebaseFirestore ff = FirebaseFirestore.instance;

    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    RestaurantDetailsEntity restaurantDetails;
    try {
      QuerySnapshot<Map<String, dynamic>> restaurantDetailsSnapshot = await ff
          .collection(RESTAURANTS_DETAILS).where(
          RESTAURANT_ID, isEqualTo: restaurantId).get();

      restaurantDetails = restaurantDetailsSnapshot
          .docs.map((value) =>
          RestaurantDetailsEntity.fromJson(value.data()))
          .toList()
          .first;
    } catch(e, s){
      throw FetchException();
    }

    return restaurantDetails;
  }


}