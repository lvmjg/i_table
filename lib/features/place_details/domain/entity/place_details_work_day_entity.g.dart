// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_work_day_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsWorkDayEntity _$PlaceDetailsWorkDayEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['open', 'close'],
  );
  return PlaceDetailsWorkDayEntity(
    json['open'] as int,
    json['close'] as int,
  );
}

Map<String, dynamic> _$PlaceDetailsWorkDayEntityToJson(
        PlaceDetailsWorkDayEntity instance) =>
    <String, dynamic>{
      'open': instance.open,
      'close': instance.close,
    };
