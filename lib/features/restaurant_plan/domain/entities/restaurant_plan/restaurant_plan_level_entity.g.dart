// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_plan_level_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantPlanLevelEntity _$RestaurantPlanLevelEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'restaurantPlanLevelName',
      'restaurantPlanLevelOrder',
      'restaurantPlan'
    ],
  );
  return RestaurantPlanLevelEntity(
    restaurantPlanLevelName: json['restaurantPlanLevelName'] as String,
    restaurantPlanLevelOrder: json['restaurantPlanLevelOrder'] as int,
    restaurantPlan: (json['restaurantPlan'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(
          k, RestaurantPlanElementEntity.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$RestaurantPlanLevelEntityToJson(
        RestaurantPlanLevelEntity instance) =>
    <String, dynamic>{
      'restaurantPlanLevelName': instance.restaurantPlanLevelName,
      'restaurantPlanLevelOrder': instance.restaurantPlanLevelOrder,
      'restaurantPlan': instance.restaurantPlan,
    };
