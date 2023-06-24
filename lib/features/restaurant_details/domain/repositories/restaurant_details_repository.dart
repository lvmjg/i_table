import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/restaurant_details_entity.dart';

abstract class RestaurantDetailsRepository{
  Future<Either<Failure, RestaurantDetailsEntity>> fetchRestaurantDetails(String restaurantId);
}