import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/util/json_converter.dart';
import 'place_order_item_model.dart';

part 'place_order_model.g.dart';

@JsonSerializable()
class PlaceOrderModel{
  @JsonKey(includeFromJson: false, includeToJson: false)
  late String id;
  final String userId;
  final String reservationId;
  final String placeId;
  final String placeName;
  final bool status;
  @TimestampConverter()
  final DateTime orderDT;
  @ModelConverter()
  final Map<String, PlaceOrderItemModel> userOrder;

  PlaceOrderModel({required this.userId, required this.reservationId, required this.placeId, required this.placeName, required this.status, required this.orderDT, required this.userOrder});

  factory PlaceOrderModel.fromJson(String orderId, Map<String, dynamic> json) {
    PlaceOrderModel placeOrderModel = _$PlaceOrderModelFromJson(json);
    placeOrderModel.id = orderId;
    return placeOrderModel;
  }

  Map<String, dynamic> toJson() => _$PlaceOrderModelToJson(this);
}

class ModelConverter implements JsonConverter<Map<String, PlaceOrderItemModel>, Map<String, dynamic>> {
  const ModelConverter();

  @override
  Map<String, PlaceOrderItemModel> fromJson(Map<String, dynamic> json) {
    Map<String, PlaceOrderItemModel> map  = json.map<String, PlaceOrderItemModel>((key, value) => MapEntry(key, PlaceOrderItemModel.fromJson(value)));
    return map;
  }

  @override
  Map<String, dynamic> toJson(Map<String, PlaceOrderItemModel> modelsMap){
    return modelsMap.map<String, dynamic>((key, value) => MapEntry(key, value.toJson()));
  }
}