// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_unlimited_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeUnlimitedReservationEntity _$TimeUnlimitedReservationEntityFromJson(
        Map<String, dynamic> json) =>
    TimeUnlimitedReservationEntity(
      canReserveBeforeAnotherReservation:
          json['canReserveBeforeAnotherReservation'] as bool? ?? true,
      reserveBeforeAnotherReservationInterval:
          json['reserveBeforeAnotherReservationInterval'] as int? ?? 120,
    );

Map<String, dynamic> _$TimeUnlimitedReservationEntityToJson(
        TimeUnlimitedReservationEntity instance) =>
    <String, dynamic>{
      'canReserveBeforeAnotherReservation':
          instance.canReserveBeforeAnotherReservation,
      'reserveBeforeAnotherReservationInterval':
          instance.reserveBeforeAnotherReservationInterval,
    };
