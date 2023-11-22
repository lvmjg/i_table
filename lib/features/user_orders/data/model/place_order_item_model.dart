import 'package:json_annotation/json_annotation.dart';

part 'place_order_item_model.g.dart';

@JsonSerializable()
class PlaceOrderItemModel {
  final String name;
  final String description;
  final String category;
  final double price;
  final int quantity;
  final bool status;

  PlaceOrderItemModel(
      {required this.name,
      required this.description,
      required this.category,
      required this.price,
      required this.quantity,
      required this.status});

  factory PlaceOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderItemModelToJson(this);
}
