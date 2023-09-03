// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsLocationModel _$PlaceDetailsLocationModelFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['latitude', 'longitude'],
  );
  return PlaceDetailsLocationModel(
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
  );
}

Map<String, dynamic> _$PlaceDetailsLocationModelToJson(
        PlaceDetailsLocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
