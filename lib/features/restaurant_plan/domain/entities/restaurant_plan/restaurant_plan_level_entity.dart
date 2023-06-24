import 'package:i_table/features/restaurant_plan/domain/entities/restaurant_plan/restaurant_plan_element_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_plan_level_entity.g.dart';

@JsonSerializable()
class RestaurantPlanLevelEntity {
  @JsonKey(includeFromJson: false, includeToJson: false)
  late String restaurantPlanLevelId;

  @JsonKey(required: true)
  late String restaurantPlanLevelName;
  @JsonKey(required: true)
  late int restaurantPlanLevelOrder;

  @JsonKey(
    required: true,
  )
  Map<String, RestaurantPlanElementEntity> restaurantPlan;

  RestaurantPlanLevelEntity(
      {required this.restaurantPlanLevelName,
      required this.restaurantPlanLevelOrder,
      required this.restaurantPlan});

  factory RestaurantPlanLevelEntity.fromJson(
      String restaurantPlanLevelId, Map<String, dynamic> json) {
    RestaurantPlanLevelEntity restaurantPlanLevelEntity =
        _$RestaurantPlanLevelEntityFromJson(json);
    restaurantPlanLevelEntity.restaurantPlanLevelId = restaurantPlanLevelId;
    return restaurantPlanLevelEntity;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = _$RestaurantPlanLevelEntityToJson(this);
    jsonMap['restaurantPlanLevelId'] = restaurantPlanLevelId;
    return jsonMap;
  }

/*  factory RestaurantPlanLevelEntity.fromJson(String restaurantPlanLevelId, Map<String, dynamic> json){
    RestaurantPlanLevelEntity restaurantPlanLevelEntity = _$RestaurantPlanLevelEntityFromJson(json);
    restaurantPlanLevelEntity.restaurantPlanLevelId = restaurantPlanLevelId;
    return restaurantPlanLevelEntity;
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> jsonMap = _$RestaurantPlanLevelEntityToJson(this);
    jsonMap['restaurantPlanLevelId'] = restaurantPlanLevelId;
    return jsonMap;
  }*/
}
