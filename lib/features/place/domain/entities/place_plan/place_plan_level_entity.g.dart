// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_plan_level_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacePlanLevelEntity _$PlacePlanLevelEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'placePlanLevelName',
      'placePlanLevelOrder',
      'placePlan'
    ],
  );
  return PlacePlanLevelEntity(
    placePlanLevelName: json['placePlanLevelName'] as String,
    placePlanLevelOrder: json['placePlanLevelOrder'] as int,
    placePlan: (json['placePlan'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(
          k, PlacePlanElementEntity.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$PlacePlanLevelEntityToJson(
        PlacePlanLevelEntity instance) =>
    <String, dynamic>{
      'placePlanLevelName': instance.placePlanLevelName,
      'placePlanLevelOrder': instance.placePlanLevelOrder,
      'placePlan': instance.placePlan,
    };
