// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_work_day_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantWorkDayEntity _$RestaurantWorkDayEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['open', 'close'],
  );
  return RestaurantWorkDayEntity(
    json['open'] as int,
    json['close'] as int,
  );
}

Map<String, dynamic> _$RestaurantWorkDayEntityToJson(
        RestaurantWorkDayEntity instance) =>
    <String, dynamic>{
      'open': instance.open,
      'close': instance.close,
    };
