// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchEntity _$SearchEntityFromJson(Map<String, dynamic> json) => SearchEntity(
      restaurantName: json['restaurantName'] as String? ?? '',
      restaurantAddress: RestaurantAddressEntity.fromJson(
          json['restaurantAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchEntityToJson(SearchEntity instance) =>
    <String, dynamic>{
      'restaurantName': instance.restaurantName,
      'restaurantAddress': instance.restaurantAddress,
    };
