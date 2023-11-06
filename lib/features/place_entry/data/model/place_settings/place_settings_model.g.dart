// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSettingsModel _$PlaceSettingsModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'placeId',
      'placeName',
      'reservationLogic',
      'reservationChat',
      'reservationConfirmation',
      'openingHours'
    ],
  );
  return PlaceSettingsModel(
    placeId: json['placeId'] as String,
    placeName: json['placeName'] as String,
    reservationLogic: ReservationLogicModel.fromJson(
        json['reservationLogic'] as Map<String, dynamic>),
    reservationChat: ReservationChatModel.fromJson(
        json['reservationChat'] as Map<String, dynamic>),
    reservationConfirmation: ReservationConfirmationModel.fromJson(
        json['reservationConfirmation'] as Map<String, dynamic>),
    openingHours: PlaceOpeningHoursModel.fromJson(
        json['openingHours'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaceSettingsModelToJson(PlaceSettingsModel instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'placeName': instance.placeName,
      'reservationLogic': instance.reservationLogic,
      'reservationChat': instance.reservationChat,
      'reservationConfirmation': instance.reservationConfirmation,
      'openingHours': instance.openingHours,
    };
