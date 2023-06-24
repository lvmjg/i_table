// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationEntity _$ReservationEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'restaurantId',
      'userId',
      'reservationStart',
      'reservationEnd',
      'numberOfPeople',
      'sittings'
    ],
  );
  return ReservationEntity(
    restaurantId: json['restaurantId'] as String,
    userId: json['userId'] as String,
    reservationStart: DateTime.parse(json['reservationStart'] as String),
    reservationEnd: DateTime.parse(json['reservationEnd'] as String),
    numberOfPeople: json['numberOfPeople'] as int,
    sittings:
        (json['sittings'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ReservationEntityToJson(ReservationEntity instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'userId': instance.userId,
      'reservationStart': instance.reservationStart.toIso8601String(),
      'reservationEnd': instance.reservationEnd.toIso8601String(),
      'numberOfPeople': instance.numberOfPeople,
      'sittings': instance.sittings,
    };
