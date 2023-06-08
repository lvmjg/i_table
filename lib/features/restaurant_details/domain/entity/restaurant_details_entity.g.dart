// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantDetailsEntity _$RestaurantDetailsEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'restaurantId',
      'restaurantLogo',
      'restaurantName',
      'restaurantAddress',
      'restaurantDescription',
      'restaurantOpeningHours',
      'restaurantUrl',
      'restaurantLocation'
    ],
  );
  return RestaurantDetailsEntity(
    restaurantId: json['restaurantId'] as String,
    restaurantLogo: json['restaurantLogo'] as String,
    restaurantName: json['restaurantName'] as String,
    restaurantAddress: RestaurantAddressEntity.fromJson(
        json['restaurantAddress'] as Map<String, dynamic>),
    restaurantDescription: json['restaurantDescription'] as String,
    restaurantOpeningHours: RestaurantOpeningHoursEntity.fromJson(
        json['restaurantOpeningHours'] as Map<String, dynamic>),
    restaurantUrl: json['restaurantUrl'] as String,
    restaurantLocation: RestaurantLocationEntity.fromJson(
        json['restaurantLocation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RestaurantDetailsEntityToJson(
        RestaurantDetailsEntity instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'restaurantLogo': instance.restaurantLogo,
      'restaurantName': instance.restaurantName,
      'restaurantAddress': instance.restaurantAddress,
      'restaurantDescription': instance.restaurantDescription,
      'restaurantOpeningHours': instance.restaurantOpeningHours,
      'restaurantUrl': instance.restaurantUrl,
      'restaurantLocation': instance.restaurantLocation,
    };
