// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceMenuModel _$PlaceMenuModelFromJson(Map<String, dynamic> json) =>
    PlaceMenuModel(
      (json['placeMenu'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, PlaceMenuItemModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$PlaceMenuModelToJson(PlaceMenuModel instance) =>
    <String, dynamic>{
      'placeMenu': instance.placeMenu,
    };
