// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_plan_level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacePlanLevelModel _$PlacePlanLevelModelFromJson(Map<String, dynamic> json) =>
    PlacePlanLevelModel(
      placePlanLevelId: json['placePlanLevelId'] as String? ?? '',
      placePlanLevelName: json['placePlanLevelName'] as String? ?? '',
      placePlanLevelOrder: json['placePlanLevelOrder'] as int? ?? 0,
      placePlanTables: (json['placePlanTables'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, PlacePlanTableModel.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
      placePlanSittings: (json['placePlanSittings'] as Map<String, dynamic>?)
              ?.map(
            (k, e) => MapEntry(
                k, PlacePlanSittingModel.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
      placePlanOthers: (json['placePlanOthers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, PlacePlanElementModel.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
    );

Map<String, dynamic> _$PlacePlanLevelModelToJson(
        PlacePlanLevelModel instance) =>
    <String, dynamic>{
      'placePlanLevelId': instance.placePlanLevelId,
      'placePlanLevelName': instance.placePlanLevelName,
      'placePlanLevelOrder': instance.placePlanLevelOrder,
      'placePlanTables': instance.placePlanTables,
      'placePlanSittings': instance.placePlanSittings,
      'placePlanOthers': instance.placePlanOthers,
    };
