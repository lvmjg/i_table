// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_plan_element_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacePlanElementModel _$PlacePlanElementModelFromJson(
        Map<String, dynamic> json) =>
    PlacePlanElementModel(
      type: json['type'] as String? ?? '',
      name: json['name'] as String? ?? '',
      columnStart: json['columnStart'] as int? ?? 0,
      columnSpan: json['columnSpan'] as int? ?? 0,
      rowStart: json['rowStart'] as int? ?? 0,
      rowSpan: json['rowSpan'] as int? ?? 0,
      color: json['color'] as String? ?? '#FFFFFF',
    );

Map<String, dynamic> _$PlacePlanElementModelToJson(
        PlacePlanElementModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'columnStart': instance.columnStart,
      'columnSpan': instance.columnSpan,
      'rowStart': instance.rowStart,
      'rowSpan': instance.rowSpan,
      'color': instance.color,
    };
