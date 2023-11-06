// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSearchModel _$PlaceSearchModelFromJson(Map<String, dynamic> json) =>
    PlaceSearchModel(
      placeName: json['placeName'] as String? ?? '',
      placeAddress: PlaceAddressModel.fromJson(
          json['placeAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceSearchModelToJson(PlaceSearchModel instance) =>
    <String, dynamic>{
      'placeName': instance.placeName,
      'placeAddress': instance.placeAddress,
    };
