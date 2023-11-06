import 'package:json_annotation/json_annotation.dart';

part 'place_address_model.g.dart';

@JsonSerializable()
class PlaceAddressModel{

  final String placeCity;
  final String placeStreet;

  PlaceAddressModel({required this.placeCity, required this.placeStreet});

  factory PlaceAddressModel.fromJson(Map<String, dynamic> json) => _$PlaceAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceAddressModelToJson(this);
}