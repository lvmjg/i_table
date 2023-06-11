// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_configuration_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantConfigurationEntity _$RestaurantConfigurationEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['restaurantId', 'reservationInterval'],
  );
  return RestaurantConfigurationEntity(
    restaurantId: json['restaurantId'] as String,
    maxReservationsPerUser: json['maxReservationsPerUser'] as int? ?? 1,
    maxNumberOfSittingsPerUser: json['maxNumberOfSittingsPerUser'] as int? ?? 4,
    reservationInterval: json['reservationInterval'] as int,
    timeRestrictedReservation: TimeRestrictedReservationEntity.fromJson(
        json['timeRestrictedReservation'] as Map<String, dynamic>),
    timeUnlimitedReservation: TimeUnlimitedReservationEntity.fromJson(
        json['timeUnlimitedReservation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RestaurantConfigurationEntityToJson(
        RestaurantConfigurationEntity instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'maxReservationsPerUser': instance.maxReservationsPerUser,
      'maxNumberOfSittingsPerUser': instance.maxNumberOfSittingsPerUser,
      'reservationInterval': instance.reservationInterval,
      'timeRestrictedReservation': instance.timeRestrictedReservation,
      'timeUnlimitedReservation': instance.timeUnlimitedReservation,
    };
