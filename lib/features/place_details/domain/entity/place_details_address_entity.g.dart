// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_address_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsAddressEntity _$PlaceDetailsAddressEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['placeStreet', 'placeCity'],
  );
  return PlaceDetailsAddressEntity(
    json['placeStreet'] as String,
    json['placeCity'] as String,
  );
}

Map<String, dynamic> _$PlaceDetailsAddressEntityToJson(
        PlaceDetailsAddressEntity instance) =>
    <String, dynamic>{
      'placeStreet': instance.placeStreet,
      'placeCity': instance.placeCity,
    };
