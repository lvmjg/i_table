// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsEntity _$PlaceDetailsEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'placeId',
      'placeLogo',
      'placeName',
      'placeAddress',
      'placeDescription',
      'placeOpeningHours',
      'placeUrl',
      'placeLocation'
    ],
  );
  return PlaceDetailsEntity(
    placeId: json['placeId'] as String,
    placeLogo: json['placeLogo'] as String,
    placeName: json['placeName'] as String,
    placeAddress: PlaceDetailsAddressEntity.fromJson(
        json['placeAddress'] as Map<String, dynamic>),
    placeDescription: json['placeDescription'] as String,
    placeOpeningHours: PlaceDetailsOpeningHoursEntity.fromJson(
        json['placeOpeningHours'] as Map<String, dynamic>),
    placeUrl: json['placeUrl'] as String,
    placeLocation: PlaceDetailsLocationEntity.fromJson(
        json['placeLocation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaceDetailsEntityToJson(PlaceDetailsEntity instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'placeLogo': instance.placeLogo,
      'placeName': instance.placeName,
      'placeAddress': instance.placeAddress,
      'placeDescription': instance.placeDescription,
      'placeOpeningHours': instance.placeOpeningHours,
      'placeUrl': instance.placeUrl,
      'placeLocation': instance.placeLocation,
    };
