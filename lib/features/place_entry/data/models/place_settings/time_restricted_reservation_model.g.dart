// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_restricted_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeRestrictedReservationModel _$TimeRestrictedReservationModelFromJson(
        Map<String, dynamic> json) =>
    TimeRestrictedReservationModel(
      maxReservationDuration: json['maxReservationDuration'] as int? ?? 120,
      minReservationDuration: json['minReservationDuration'] as int? ?? 60,
      reservationDefaultDuration:
          json['reservationDefaultDuration'] as int? ?? 60,
      reservationDurationInterval:
          json['reservationDurationInterval'] as int? ?? 60,
    );

Map<String, dynamic> _$TimeRestrictedReservationModelToJson(
        TimeRestrictedReservationModel instance) =>
    <String, dynamic>{
      'maxReservationDuration': instance.maxReservationDuration,
      'minReservationDuration': instance.minReservationDuration,
      'reservationDefaultDuration': instance.reservationDefaultDuration,
      'reservationDurationInterval': instance.reservationDurationInterval,
    };
