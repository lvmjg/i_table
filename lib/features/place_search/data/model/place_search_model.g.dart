// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSearchModel _$PlaceSearchModelFromJson(Map<String, dynamic> json) =>
    PlaceSearchModel(
      placeName: json['placeName'] as String,
      placeAddress: PlaceAddressModel.fromJson(
          json['placeAddress'] as Map<String, dynamic>),
      placeDescription: json['placeDescription'] as String,
      placeOpeningHours: PlaceHoursModel.fromJson(
          json['placeOpeningHours'] as Map<String, dynamic>),
      placeUrl: json['placeUrl'] as String,
      placeLocation: PlaceLocationModel.fromJson(
          json['placeLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceSearchModelToJson(PlaceSearchModel instance) =>
    <String, dynamic>{
      'placeName': instance.placeName,
      'placeAddress': instance.placeAddress,
      'placeDescription': instance.placeDescription,
      'placeOpeningHours': instance.placeOpeningHours,
      'placeUrl': instance.placeUrl,
      'placeLocation': instance.placeLocation,
    };
