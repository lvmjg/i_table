import 'package:json_annotation/json_annotation.dart';

part 'restaurant_location_entity.g.dart';

@JsonSerializable()
class RestaurantLocationEntity {
  @JsonKey(required: true)
  final String latitude;

  @JsonKey(required: true)
  final String longitude;

  RestaurantLocationEntity({required this.latitude, required this.longitude});

  factory RestaurantLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$RestaurantLocationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantLocationEntityToJson(this);
}
