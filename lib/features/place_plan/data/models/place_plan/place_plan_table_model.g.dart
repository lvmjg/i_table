// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_plan_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacePlanTableModel _$PlacePlanTableModelFromJson(Map<String, dynamic> json) =>
    PlacePlanTableModel(
      allowReservation: json['allowReservation'] as bool? ?? true,
      exclusiveReserve: json['exclusiveReserve'] as bool? ?? true,
      groups: (json['groups'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, (e as List<dynamic>).map((e) => e as String).toList()),
          ) ??
          {},
      type: json['type'] as String? ?? '',
      name: json['name'] as String? ?? '',
      columnStart: json['columnStart'] as int? ?? 0,
      columnSpan: json['columnSpan'] as int? ?? 0,
      rowStart: json['rowStart'] as int? ?? 0,
      rowSpan: json['rowSpan'] as int? ?? 0,
      color: json['color'] as String? ?? '#FFFFFF',
    );

Map<String, dynamic> _$PlacePlanTableModelToJson(
        PlacePlanTableModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'columnStart': instance.columnStart,
      'columnSpan': instance.columnSpan,
      'rowStart': instance.rowStart,
      'rowSpan': instance.rowSpan,
      'color': instance.color,
      'allowReservation': instance.allowReservation,
      'exclusiveReserve': instance.exclusiveReserve,
      'groups': instance.groups,
    };
