// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderItemModel _$PlaceOrderItemModelFromJson(Map<String, dynamic> json) =>
    PlaceOrderItemModel(
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      note: json['note'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$PlaceOrderItemModelToJson(
        PlaceOrderItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'quantity': instance.quantity,
      'note': instance.note,
      'status': instance.status,
    };
