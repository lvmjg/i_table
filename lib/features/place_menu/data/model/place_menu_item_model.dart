import 'package:json_annotation/json_annotation.dart';

part 'place_menu_item_model.g.dart';

@JsonSerializable()
class PlaceMenuItemModel{
  final String name;
  final String description;
  final String category;
  final double price;

  PlaceMenuItemModel(this.name, this.description, this.category, this.price);

  factory PlaceMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceMenuItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceMenuItemModelToJson(this);
}