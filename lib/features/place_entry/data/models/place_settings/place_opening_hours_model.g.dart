// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_opening_hours_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOpeningHoursModel _$PlaceOpeningHoursModelFromJson(
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
  return PlaceOpeningHoursModel(
    monday: PlaceWorkDayModel.fromJson(json['monday'] as Map<String, dynamic>),
    tuesday:
        PlaceWorkDayModel.fromJson(json['tuesday'] as Map<String, dynamic>),
    wednesday:
        PlaceWorkDayModel.fromJson(json['wednesday'] as Map<String, dynamic>),
    thursday:
        PlaceWorkDayModel.fromJson(json['thursday'] as Map<String, dynamic>),
    friday: PlaceWorkDayModel.fromJson(json['friday'] as Map<String, dynamic>),
    saturday:
        PlaceWorkDayModel.fromJson(json['saturday'] as Map<String, dynamic>),
    sunday: PlaceWorkDayModel.fromJson(json['sunday'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaceOpeningHoursModelToJson(
        PlaceOpeningHoursModel instance) =>
    <String, dynamic>{
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
    };
