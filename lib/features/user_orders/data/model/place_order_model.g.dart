// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderModel _$PlaceOrderModelFromJson(Map<String, dynamic> json) =>
    PlaceOrderModel(
      userId: json['userId'] as String,
      reservationId: json['reservationId'] as String,
      placeId: json['placeId'] as String,
      placeName: json['placeName'] as String,
      status: json['status'] as bool,
      orderDT:
          const TimestampConverter().fromJson(json['orderDT'] as Timestamp),
      userOrder: const ModelConverter()
          .fromJson(json['userOrder'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceOrderModelToJson(PlaceOrderModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'reservationId': instance.reservationId,
      'placeId': instance.placeId,
      'placeName': instance.placeName,
      'status': instance.status,
      'orderDT': const TimestampConverter().toJson(instance.orderDT),
      'userOrder': const ModelConverter().toJson(instance.userOrder),
    };
