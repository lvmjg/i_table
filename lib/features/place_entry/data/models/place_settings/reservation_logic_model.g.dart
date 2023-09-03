// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_logic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationLogicModel _$ReservationLogicModelFromJson(
        Map<String, dynamic> json) =>
    ReservationLogicModel(
      reservationMode: json['reservationMode'] as int? ?? 0,
      maxNumberOfReservationsPerUser:
          json['maxNumberOfReservationsPerUser'] as int? ?? 1,
      maxNumberOfSittingsPerUser:
          json['maxNumberOfSittingsPerUser'] as int? ?? 1,
      reservationInterval: json['reservationInterval'] as int? ?? 30,
      reservationDaysAhead: json['reservationDaysAhead'] as int? ?? 30,
      timeRestrictedReservation: TimeRestrictedReservationModel.fromJson(
          json['timeRestrictedReservation'] as Map<String, dynamic>),
      timeUnlimitedReservation: TimeUnlimitedReservationModel.fromJson(
          json['timeUnlimitedReservation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReservationLogicModelToJson(
        ReservationLogicModel instance) =>
    <String, dynamic>{
      'reservationMode': instance.reservationMode,
      'maxNumberOfReservationsPerUser': instance.maxNumberOfReservationsPerUser,
      'maxNumberOfSittingsPerUser': instance.maxNumberOfSittingsPerUser,
      'reservationInterval': instance.reservationInterval,
      'reservationDaysAhead': instance.reservationDaysAhead,
      'timeRestrictedReservation': instance.timeRestrictedReservation,
      'timeUnlimitedReservation': instance.timeUnlimitedReservation,
    };
