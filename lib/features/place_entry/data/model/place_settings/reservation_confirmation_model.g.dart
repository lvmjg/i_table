// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_confirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationConfirmationModel _$ReservationConfirmationModelFromJson(
        Map<String, dynamic> json) =>
    ReservationConfirmationModel(
      confirmationEnabled: json['confirmationEnabled'] as bool? ?? true,
      confirmBeforeDays: json['confirmBeforeDays'] as int? ?? 1,
      informBeforeDays: json['informBeforeDays'] as int? ?? 2,
    );

Map<String, dynamic> _$ReservationConfirmationModelToJson(
        ReservationConfirmationModel instance) =>
    <String, dynamic>{
      'confirmationEnabled': instance.confirmationEnabled,
      'confirmBeforeDays': instance.confirmBeforeDays,
      'informBeforeDays': instance.informBeforeDays,
    };
