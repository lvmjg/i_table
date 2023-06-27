// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSettingsEntity _$PlaceSettingsEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['placeId', 'reservationInterval'],
  );
  return PlaceSettingsEntity(
    placeId: json['placeId'] as String,
    maxReservationsPerUser: json['maxReservationsPerUser'] as int? ?? 1,
    maxNumberOfSittingsPerUser: json['maxNumberOfSittingsPerUser'] as int? ?? 4,
    reservationInterval: json['reservationInterval'] as int,
    timeRestrictedReservation: TimeRestrictedReservationEntity.fromJson(
        json['timeRestrictedReservation'] as Map<String, dynamic>),
    timeUnlimitedReservation: TimeUnlimitedReservationEntity.fromJson(
        json['timeUnlimitedReservation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaceSettingsEntityToJson(
        PlaceSettingsEntity instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'maxReservationsPerUser': instance.maxReservationsPerUser,
      'maxNumberOfSittingsPerUser': instance.maxNumberOfSittingsPerUser,
      'reservationInterval': instance.reservationInterval,
      'timeRestrictedReservation': instance.timeRestrictedReservation,
      'timeUnlimitedReservation': instance.timeUnlimitedReservation,
    };
