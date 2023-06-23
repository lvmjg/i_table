// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_address_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantAddressEntity _$RestaurantAddressEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['restaurantStreet', 'restaurantCity'],
  );
  return RestaurantAddressEntity(
    json['restaurantStreet'] as String,
    json['restaurantCity'] as String,
  );
}

Map<String, dynamic> _$RestaurantAddressEntityToJson(
        RestaurantAddressEntity instance) =>
    <String, dynamic>{
      'restaurantStreet': instance.restaurantStreet,
      'restaurantCity': instance.restaurantCity,
    };
