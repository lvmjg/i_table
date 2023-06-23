
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_address_entity.g.dart';

@JsonSerializable()
class RestaurantAddressEntity{
  @JsonKey(required: true)
  final String restaurantStreet;

  @JsonKey(required: true)
  final String restaurantCity;

  RestaurantAddressEntity(this.restaurantStreet, this.restaurantCity);

  factory RestaurantAddressEntity.fromJson(Map<String, dynamic> json) => _$RestaurantAddressEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantAddressEntityToJson(this);

  @override
  String toString(){
    return '$restaurantStreet, $restaurantCity';
  }
}