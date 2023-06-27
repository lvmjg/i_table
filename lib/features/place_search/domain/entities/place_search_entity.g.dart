// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSearchEntity _$PlaceSearchEntityFromJson(Map<String, dynamic> json) =>
    PlaceSearchEntity(
      placeName: json['placeName'] as String? ?? '',
      placeAddress: PlaceDetailsAddressEntity.fromJson(
          json['placeAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceSearchEntityToJson(PlaceSearchEntity instance) =>
    <String, dynamic>{
      'placeName': instance.placeName,
      'placeAddress': instance.placeAddress,
    };
