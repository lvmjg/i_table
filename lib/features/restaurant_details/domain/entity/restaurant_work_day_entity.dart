import 'package:json_annotation/json_annotation.dart';

part 'restaurant_work_day_entity.g.dart';

@JsonSerializable()
class RestaurantWorkDayEntity {
  @JsonKey(required: true)
  final int open;

  @JsonKey(required: true)
  final int close;

  RestaurantWorkDayEntity(this.open, this.close);

  factory RestaurantWorkDayEntity.fromJson(Map<String, dynamic> json) =>
      _$RestaurantWorkDayEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantWorkDayEntityToJson(this);
}
