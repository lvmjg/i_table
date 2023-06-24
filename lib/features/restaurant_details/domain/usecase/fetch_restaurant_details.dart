import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_details_entity.dart';

import '../repositories/restaurant_details_repository.dart';

class FetchRestaurantDetails
    implements UseCase<RestaurantDetailsEntity, RestaurantIdParams> {
  final RestaurantDetailsRepository restaurantDetailsRepository;

  FetchRestaurantDetails(this.restaurantDetailsRepository);

  @override
  Future<Either<Failure, RestaurantDetailsEntity>> call(
      RestaurantIdParams params) {
    return restaurantDetailsRepository
        .fetchRestaurantDetails(params.restaurantId);
  }
}

class RestaurantIdParams extends Params {
  final String restaurantId;

  RestaurantIdParams({required this.restaurantId});

  @override
  List<Object> get props => [restaurantId];
}
