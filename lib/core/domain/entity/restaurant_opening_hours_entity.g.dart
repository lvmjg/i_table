// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_opening_hours_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantOpeningHoursEntity _$RestaurantOpeningHoursEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
      'sunday'
    ],
  );
  return RestaurantOpeningHoursEntity(
    monday: RestaurantWorkDayEntity.fromJson(
        json['monday'] as Map<String, dynamic>),
    tuesday: RestaurantWorkDayEntity.fromJson(
        json['tuesday'] as Map<String, dynamic>),
    wednesday: RestaurantWorkDayEntity.fromJson(
        json['wednesday'] as Map<String, dynamic>),
    thursday: RestaurantWorkDayEntity.fromJson(
        json['thursday'] as Map<String, dynamic>),
    friday: RestaurantWorkDayEntity.fromJson(
        json['friday'] as Map<String, dynamic>),
    saturday: RestaurantWorkDayEntity.fromJson(
        json['saturday'] as Map<String, dynamic>),
    sunday: RestaurantWorkDayEntity.fromJson(
        json['sunday'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RestaurantOpeningHoursEntityToJson(
        RestaurantOpeningHoursEntity instance) =>
    <String, dynamic>{
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
    };
