// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_hours_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceHoursModel _$PlaceHoursModelFromJson(Map<String, dynamic> json) {
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
  return PlaceHoursModel(
    monday: json['monday'] as String,
    tuesday: json['tuesday'] as String,
    wednesday: json['wednesday'] as String,
    thursday: json['thursday'] as String,
    friday: json['friday'] as String,
    saturday: json['saturday'] as String,
    sunday: json['sunday'] as String,
  );
}

Map<String, dynamic> _$PlaceHoursModelToJson(PlaceHoursModel instance) =>
    <String, dynamic>{
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
    };
