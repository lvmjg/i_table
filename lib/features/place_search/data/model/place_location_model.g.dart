// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceLocationModel _$PlaceLocationModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['latitude', 'longitude'],
  );
  return PlaceLocationModel(
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
  );
}

Map<String, dynamic> _$PlaceLocationModelToJson(PlaceLocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
