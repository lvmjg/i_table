import 'package:json_annotation/json_annotation.dart';

import 'place_menu_item_model.dart';

part 'place_menu_model.g.dart';

@JsonSerializable()
class PlaceMenuModel {
  final Map<String, PlaceMenuItemModel> placeMenu;

  PlaceMenuModel(this.placeMenu);

  factory PlaceMenuModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceMenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceMenuModelToJson(this);
}
