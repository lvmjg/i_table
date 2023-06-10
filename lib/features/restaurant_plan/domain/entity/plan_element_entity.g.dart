// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_element_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanElementEntity _$PlanElementEntityFromJson(Map<String, dynamic> json) =>
    PlanElementEntity(
      type: json['type'] as String,
      name: json['name'] as String,
      columnStart: json['columnStart'] as int,
      columnSpan: json['columnSpan'] as int,
      rowStart: json['rowStart'] as int,
      rowSpan: json['rowSpan'] as int,
      color: json['color'] as String,
    )..connectedSittngs = (json['connectedSittngs'] as List<dynamic>)
        .map((e) => e as String)
        .toList();

Map<String, dynamic> _$PlanElementEntityToJson(PlanElementEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'columnStart': instance.columnStart,
      'columnSpan': instance.columnSpan,
      'rowStart': instance.rowStart,
      'rowSpan': instance.rowSpan,
      'color': instance.color,
      'connectedSittngs': instance.connectedSittngs,
    };
