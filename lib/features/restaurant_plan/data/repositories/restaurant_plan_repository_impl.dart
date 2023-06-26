import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/features/restaurant_plan/data/datasources/restaurant_plan_remote_data_source.dart';

import '../../domain/entities/restaurant_plan/restaurant_plan_level_entity.dart';
import '../../domain/repositories/restaurant_plan_repository.dart';

class RestaurantPlanRepositoryImpl implements RestaurantPlanRepository {
  final RestaurantPlanRemoteDataSource restaurantPlanRemoteDataSource;

  RestaurantPlanRepositoryImpl(this.restaurantPlanRemoteDataSource);

  @override
  Future<Either<Failure, List<RestaurantPlanLevelEntity>>> fetchRestaurantPlan(
      String restaurantId) async {
    try {
      List<RestaurantPlanLevelEntity> restaurantPlanLevels =
          await restaurantPlanRemoteDataSource
              .fetchRestaurantPlan(restaurantId);
      return Right(restaurantPlanLevels);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
