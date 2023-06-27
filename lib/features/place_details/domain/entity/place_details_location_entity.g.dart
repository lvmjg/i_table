// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_location_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsLocationEntity _$PlaceDetailsLocationEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['latitude', 'longitude'],
  );
  return PlaceDetailsLocationEntity(
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
  );
}

Map<String, dynamic> _$PlaceDetailsLocationEntityToJson(
        PlaceDetailsLocationEntity instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
