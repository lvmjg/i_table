import 'package:json_annotation/json_annotation.dart';

part 'place_details_work_day_entity.g.dart';

@JsonSerializable()
class PlaceDetailsWorkDayEntity {
  @JsonKey(required: true)
  final int open;

  @JsonKey(required: true)
  final int close;

  PlaceDetailsWorkDayEntity(this.open, this.close);

  factory PlaceDetailsWorkDayEntity.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsWorkDayEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsWorkDayEntityToJson(this);
}
