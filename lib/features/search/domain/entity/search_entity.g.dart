// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchEntity _$SearchEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['restaurantId'],
  );
  return SearchEntity(
    restaurantId: json['restaurantId'] as String,
    restaurantName: json['restaurantName'] as String? ?? '',
    restaurantAddress: json['restaurantAddress'] as String? ?? '',
  );
}

Map<String, dynamic> _$SearchEntityToJson(SearchEntity instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'restaurantAddress': instance.restaurantAddress,
    };
