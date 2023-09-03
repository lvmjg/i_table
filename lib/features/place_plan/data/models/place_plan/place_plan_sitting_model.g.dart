// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_plan_sitting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacePlanSittingModel _$PlacePlanSittingModelFromJson(
        Map<String, dynamic> json) =>
    PlacePlanSittingModel(
      group: json['group'] as String? ?? '',
      table: json['table'] as String? ?? '',
      type: json['type'] as String? ?? '',
      name: json['name'] as String? ?? '',
      columnStart: json['columnStart'] as int? ?? 0,
      columnSpan: json['columnSpan'] as int? ?? 0,
      rowStart: json['rowStart'] as int? ?? 0,
      rowSpan: json['rowSpan'] as int? ?? 0,
      color: json['color'] as String? ?? '#FFFFFF',
    );

Map<String, dynamic> _$PlacePlanSittingModelToJson(
        PlacePlanSittingModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'columnStart': instance.columnStart,
      'columnSpan': instance.columnSpan,
      'rowStart': instance.rowStart,
      'rowSpan': instance.rowSpan,
      'color': instance.color,
      'group': instance.group,
      'table': instance.table,
    };
