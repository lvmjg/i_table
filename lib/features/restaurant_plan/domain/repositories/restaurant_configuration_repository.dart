import 'package:dartz/dartz.dart';
import 'package:i_table/features/restaurant_plan/domain/entities/restaurant_configuration/restaurant_configuration_entity.dart';

import '../../../../core/error/failures.dart';

abstract class RestaurantConfigurationRepository {
  Future<Either<Failure, RestaurantConfigurationEntity>>
      fetchRestaurantConfiguration(String restaurantId);
}
