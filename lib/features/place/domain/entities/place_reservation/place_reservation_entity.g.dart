// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_reservation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceReservationEntity _$PlaceReservationEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'placeId',
      'userId',
      'reservationStart',
      'reservationEnd',
      'numberOfPeople',
      'sittings'
    ],
  );
  return PlaceReservationEntity(
    placeId: json['placeId'] as String,
    userId: json['userId'] as String,
    reservationStart: DateTime.parse(json['reservationStart'] as String),
    reservationEnd: DateTime.parse(json['reservationEnd'] as String),
    numberOfPeople: json['numberOfPeople'] as int,
    sittings:
        (json['sittings'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$PlaceReservationEntityToJson(
        PlaceReservationEntity instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'userId': instance.userId,
      'reservationStart': instance.reservationStart.toIso8601String(),
      'reservationEnd': instance.reservationEnd.toIso8601String(),
      'numberOfPeople': instance.numberOfPeople,
      'sittings': instance.sittings,
    };
