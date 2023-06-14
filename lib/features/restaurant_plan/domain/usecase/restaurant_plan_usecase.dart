import 'package:i_table/features/restaurant_plan/data/repository/restaurant_plan_repository.dart';
import 'package:i_table/features/restaurant_plan/domain/entity/restaurant_configuration/restaurant_configuration_entity.dart';
import 'package:i_table/features/restaurant_plan/domain/entity/restaurant_plan/restaurant_plan_level_entity.dart';
import 'package:i_table/features/restaurant_plan/domain/entity/restaurant_plan/restaurant_setting.dart';

class RestaurantPlanUseCase{


  Future<RestaurantSetting> fetchRestaurantSetting(String restaurantId) async {
    RestaurantPlanRepository restaurantPlanRepository = RestaurantPlanRepository();

    RestaurantConfigurationEntity? restaurantConfiguration = await restaurantPlanRepository.fetchConfiguration(restaurantId);

    List<RestaurantPlanLevelEntity> restaurantPlanLevels = await restaurantPlanRepository.fetchRestaurantPlan(restaurantId);

    return RestaurantSetting(restaurantConfiguration, restaurantPlanLevels);
  }
}