// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_plan_element_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacePlanElementEntity _$PlacePlanElementEntityFromJson(
        Map<String, dynamic> json) =>
    PlacePlanElementEntity(
      type: json['type'] as String,
      name: json['name'] as String,
      columnStart: json['columnStart'] as int,
      columnSpan: json['columnSpan'] as int,
      rowStart: json['rowStart'] as int,
      rowSpan: json['rowSpan'] as int,
      color: json['color'] as String,
    )
      ..connectedTable = json['connectedTable'] as String? ?? ''
      ..connectedSittings = (json['connectedSittings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          []
      ..canReserveTable = json['canReserveTable'] as bool? ?? true
      ..groupedSittings =
          (json['groupedSittings'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(
                    k, (e as List<dynamic>).map((e) => e as String).toList()),
              ) ??
              {};

Map<String, dynamic> _$PlacePlanElementEntityToJson(
        PlacePlanElementEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'columnStart': instance.columnStart,
      'columnSpan': instance.columnSpan,
      'rowStart': instance.rowStart,
      'rowSpan': instance.rowSpan,
      'color': instance.color,
      'connectedTable': instance.connectedTable,
      'connectedSittings': instance.connectedSittings,
      'canReserveTable': instance.canReserveTable,
      'groupedSittings': instance.groupedSittings,
    };
