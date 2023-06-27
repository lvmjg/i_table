import 'package:i_table/features/place_details/domain/entity/place_details_work_day_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_details_opening_hours_entity.g.dart';

@JsonSerializable()
class PlaceDetailsOpeningHoursEntity {
  @JsonKey(required: true)
  final PlaceDetailsWorkDayEntity monday;

  @JsonKey(required: true)
  final PlaceDetailsWorkDayEntity tuesday;

  @JsonKey(required: true)
  final PlaceDetailsWorkDayEntity wednesday;

  @JsonKey(required: true)
  final PlaceDetailsWorkDayEntity thursday;

  @JsonKey(required: true)
  final PlaceDetailsWorkDayEntity friday;

  @JsonKey(required: true)
  final PlaceDetailsWorkDayEntity saturday;

  @JsonKey(required: true)
  final PlaceDetailsWorkDayEntity sunday;

  PlaceDetailsOpeningHoursEntity(
      {required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.sunday});

  factory PlaceDetailsOpeningHoursEntity.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsOpeningHoursEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsOpeningHoursEntityToJson(this);
}
