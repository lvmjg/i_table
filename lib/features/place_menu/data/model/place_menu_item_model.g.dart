// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceMenuItemModel _$PlaceMenuItemModelFromJson(Map<String, dynamic> json) =>
    PlaceMenuItemModel(
      json['name'] as String,
      json['description'] as String,
      json['category'] as String,
      (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$PlaceMenuItemModelToJson(PlaceMenuItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
    };
