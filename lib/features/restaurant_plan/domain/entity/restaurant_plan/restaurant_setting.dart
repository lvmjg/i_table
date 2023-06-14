import 'package:i_table/features/restaurant_plan/domain/entity/restaurant_configuration/restaurant_configuration_entity.dart';
import 'package:i_table/features/restaurant_plan/domain/entity/restaurant_plan/restaurant_plan_element_entity.dart';
import 'package:i_table/features/restaurant_plan/domain/entity/restaurant_plan/restaurant_plan_level_entity.dart';

class RestaurantSetting{

  final RestaurantConfigurationEntity? restaurantConfiguration;
  final List<RestaurantPlanLevelEntity> restaurantPlanLevels;

  RestaurantSetting(this.restaurantConfiguration, this.restaurantPlanLevels);
}