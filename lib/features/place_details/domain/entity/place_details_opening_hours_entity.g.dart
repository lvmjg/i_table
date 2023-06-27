// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_opening_hours_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsOpeningHoursEntity _$PlaceDetailsOpeningHoursEntityFromJson(
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
  return PlaceDetailsOpeningHoursEntity(
    monday: PlaceDetailsWorkDayEntity.fromJson(
        json['monday'] as Map<String, dynamic>),
    tuesday: PlaceDetailsWorkDayEntity.fromJson(
        json['tuesday'] as Map<String, dynamic>),
    wednesday: PlaceDetailsWorkDayEntity.fromJson(
        json['wednesday'] as Map<String, dynamic>),
    thursday: PlaceDetailsWorkDayEntity.fromJson(
        json['thursday'] as Map<String, dynamic>),
    friday: PlaceDetailsWorkDayEntity.fromJson(
        json['friday'] as Map<String, dynamic>),
    saturday: PlaceDetailsWorkDayEntity.fromJson(
        json['saturday'] as Map<String, dynamic>),
    sunday: PlaceDetailsWorkDayEntity.fromJson(
        json['sunday'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaceDetailsOpeningHoursEntityToJson(
        PlaceDetailsOpeningHoursEntity instance) =>
    <String, dynamic>{
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
    };
