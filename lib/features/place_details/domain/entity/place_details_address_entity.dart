
import 'package:json_annotation/json_annotation.dart';

part 'place_details_address_entity.g.dart';

@JsonSerializable()
class PlaceDetailsAddressEntity{
  @JsonKey(required: true)
  final String placeStreet;

  @JsonKey(required: true)
  final String placeCity;

  PlaceDetailsAddressEntity(this.placeStreet, this.placeCity);

  factory PlaceDetailsAddressEntity.fromJson(Map<String, dynamic> json) => _$PlaceDetailsAddressEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsAddressEntityToJson(this);

  @override
  String toString(){
    return '$placeStreet, $placeCity';
  }
}