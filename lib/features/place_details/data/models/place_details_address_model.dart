
import 'package:json_annotation/json_annotation.dart';

part 'place_details_address_model.g.dart';

@JsonSerializable()
class PlaceDetailsAddressModel{
  @JsonKey(required: true)
  final String placeStreet;
  @JsonKey(required: true)
  final String placeCity;

  PlaceDetailsAddressModel({required this.placeStreet, required this.placeCity});

  factory PlaceDetailsAddressModel.fromJson(Map<String, dynamic> json) => _$PlaceDetailsAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsAddressModelToJson(this);
}