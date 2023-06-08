import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/features/restaurant_details/data/repository/restaurant_details_repository.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_details_entity.dart';

class RestaurantDetailsUseCase{


  Future<RestaurantDetailsEntity?> fetchRestaurantDetails(String restaurantId) async{
    RestaurantDetailsRepository restaurantDetailsRepository = new RestaurantDetailsRepository();

    return restaurantDetailsRepository.fetchRestaurantDetails(restaurantId);
  }

}