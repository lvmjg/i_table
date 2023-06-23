// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_location_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantLocationEntity _$RestaurantLocationEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['latitude', 'longitude'],
  );
  return RestaurantLocationEntity(
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
  );
}

Map<String, dynamic> _$RestaurantLocationEntityToJson(
        RestaurantLocationEntity instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
