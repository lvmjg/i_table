import 'package:i_table/features/restaurant_plan/domain/entities/restaurant_plan/restaurant_plan_level_entity.dart';

import '../restaurant_configuration/restaurant_configuration_entity.dart';

class RestaurantSetting{

  final RestaurantConfigurationEntity? restaurantConfiguration;
  final List<RestaurantPlanLevelEntity> restaurantPlanLevels;

  RestaurantSetting(this.restaurantConfiguration, this.restaurantPlanLevels);
}