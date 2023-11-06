// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceMenuItemModel _$PlaceMenuItemModelFromJson(Map<String, dynamic> json) =>
    PlaceMenuItemModel(
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$PlaceMenuItemModelToJson(PlaceMenuItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
    };
