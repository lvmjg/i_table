// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_unlimited_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeUnlimitedReservationModel _$TimeUnlimitedReservationModelFromJson(
        Map<String, dynamic> json) =>
    TimeUnlimitedReservationModel(
      canReserveBeforeAnotherReservation:
          json['canReserveBeforeAnotherReservation'] as bool? ?? true,
      reserveBeforeAnotherReservationInterval:
          json['reserveBeforeAnotherReservationInterval'] as int? ?? 120,
    );

Map<String, dynamic> _$TimeUnlimitedReservationModelToJson(
        TimeUnlimitedReservationModel instance) =>
    <String, dynamic>{
      'canReserveBeforeAnotherReservation':
          instance.canReserveBeforeAnotherReservation,
      'reserveBeforeAnotherReservationInterval':
          instance.reserveBeforeAnotherReservationInterval,
    };
