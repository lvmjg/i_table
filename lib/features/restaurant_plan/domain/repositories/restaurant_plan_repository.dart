import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/restaurant_plan/restaurant_plan_level_entity.dart';

abstract class RestaurantPlanRepository {
  Future<Either<Failure, List<RestaurantPlanLevelEntity>>> fetchRestaurantPlan(
      String restaurantId);
}
