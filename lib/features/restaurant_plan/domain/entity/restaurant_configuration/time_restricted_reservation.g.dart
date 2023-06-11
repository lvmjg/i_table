// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_restricted_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeRestrictedReservationEntity _$TimeRestrictedReservationEntityFromJson(
        Map<String, dynamic> json) =>
    TimeRestrictedReservationEntity(
      maximalReservationDuration:
          json['maximalReservationDuration'] as int? ?? 120,
      minimalReservationDuration:
          json['minimalReservationDuration'] as int? ?? 60,
    );

Map<String, dynamic> _$TimeRestrictedReservationEntityToJson(
        TimeRestrictedReservationEntity instance) =>
    <String, dynamic>{
      'maximalReservationDuration': instance.maximalReservationDuration,
      'minimalReservationDuration': instance.minimalReservationDuration,
    };
