import 'package:i_table/features/restaurant_details/domain/entity/restaurant_work_day_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_opening_hours_entity.g.dart';

@JsonSerializable()
class RestaurantOpeningHoursEntity {
  @JsonKey(required: true)
  final RestaurantWorkDayEntity monday;

  @JsonKey(required: true)
  final RestaurantWorkDayEntity tuesday;

  @JsonKey(required: true)
  final RestaurantWorkDayEntity wednesday;

  @JsonKey(required: true)
  final RestaurantWorkDayEntity thursday;

  @JsonKey(required: true)
  final RestaurantWorkDayEntity friday;

  @JsonKey(required: true)
  final RestaurantWorkDayEntity saturday;

  @JsonKey(required: true)
  final RestaurantWorkDayEntity sunday;

  RestaurantOpeningHoursEntity(
      {required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.sunday});

  factory RestaurantOpeningHoursEntity.fromJson(Map<String, dynamic> json) =>
      _$RestaurantOpeningHoursEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantOpeningHoursEntityToJson(this);
}
