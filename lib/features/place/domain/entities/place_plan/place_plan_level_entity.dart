import 'package:i_table/features/place/domain/entities/place_plan/place_plan_element_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_plan_level_entity.g.dart';

@JsonSerializable()
class PlacePlanLevelEntity {
  @JsonKey(includeFromJson: false, includeToJson: false)
  late String placePlanLevelId;

  @JsonKey(required: true)
  late String placePlanLevelName;
  @JsonKey(required: true)
  late int placePlanLevelOrder;

  @JsonKey(
    required: true,
  )
  Map<String, PlacePlanElementEntity> placePlan;

  PlacePlanLevelEntity(
      {required this.placePlanLevelName,
      required this.placePlanLevelOrder,
      required this.placePlan});

  factory PlacePlanLevelEntity.fromJson(
      String placePlanLevelId, Map<String, dynamic> json) {
    PlacePlanLevelEntity placePlanLevelEntity =
        _$PlacePlanLevelEntityFromJson(json);
    placePlanLevelEntity.placePlanLevelId = placePlanLevelId;
    return placePlanLevelEntity;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = _$PlacePlanLevelEntityToJson(this);
    jsonMap['placePlanLevelId'] = placePlanLevelId;
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
