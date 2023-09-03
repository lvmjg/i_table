// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsAddressModel _$PlaceDetailsAddressModelFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['placeStreet', 'placeCity'],
  );
  return PlaceDetailsAddressModel(
    placeStreet: json['placeStreet'] as String,
    placeCity: json['placeCity'] as String,
  );
}

Map<String, dynamic> _$PlaceDetailsAddressModelToJson(
        PlaceDetailsAddressModel instance) =>
    <String, dynamic>{
      'placeStreet': instance.placeStreet,
      'placeCity': instance.placeCity,
    };
