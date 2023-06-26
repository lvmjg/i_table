import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/features/restaurant_plan/data/datasources/restaurant_configuration_remote_data_source.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/restaurant_configuration/restaurant_configuration_entity.dart';
import '../../domain/repositories/restaurant_configuration_repository.dart';

class RestaurantConfigurationRepositoryImpl
    implements RestaurantConfigurationRepository {
  final RestaurantConfigurationRemoteDataSource
      restaurantConfigurationRemoteDataSource;

  RestaurantConfigurationRepositoryImpl(
      this.restaurantConfigurationRemoteDataSource);

  @override
  Future<Either<Failure, RestaurantConfigurationEntity>>
      fetchRestaurantConfiguration(String restaurantId) async {
    try {
      RestaurantConfigurationEntity? restaurantPlanLevels =
          await restaurantConfigurationRemoteDataSource
              .fetchRestaurantConfiguration(restaurantId);
      if (restaurantPlanLevels != null) {
        return Right(restaurantPlanLevels);
      } else {
        return Left(FetchFailure());
      }
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
