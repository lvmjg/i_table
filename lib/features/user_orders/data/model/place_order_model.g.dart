// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderModel _$PlaceOrderModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['reservationId'],
  );
  return PlaceOrderModel(
    userId: json['userId'] as String,
    reservationId: json['reservationId'] as String?,
    placeId: json['placeId'] as String,
    placeName: json['placeName'] as String,
    status: json['status'] as bool,
    orderDT: const TimestampConverter().fromJson(json['orderDT'] as Timestamp),
    userOrder: const ModelConverter()
        .fromJson(json['userOrder'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaceOrderModelToJson(PlaceOrderModel instance) {
  final val = <String, dynamic>{
    'userId': instance.userId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reservationId', instance.reservationId);
  val['placeId'] = instance.placeId;
  val['placeName'] = instance.placeName;
  val['status'] = instance.status;
  val['orderDT'] = const TimestampConverter().toJson(instance.orderDT);
  val['userOrder'] = const ModelConverter().toJson(instance.userOrder);
  return val;
}
