import 'package:i_table/features/place_entry/data/model/place_settings/place_work_day_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_opening_hours_model.g.dart';

@JsonSerializable()
class PlaceOpeningHoursModel {
  @JsonKey(required: true)
  final PlaceWorkDayModel monday;
  @JsonKey(required: true)
  final PlaceWorkDayModel tuesday;
  @JsonKey(required: true)
  final PlaceWorkDayModel wednesday;
  @JsonKey(required: true)
  final PlaceWorkDayModel thursday;
  @JsonKey(required: true)
  final PlaceWorkDayModel friday;
  @JsonKey(required: true)
  final PlaceWorkDayModel saturday;
  @JsonKey(required: true)
  final PlaceWorkDayModel sunday;

  PlaceOpeningHoursModel(
      {required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.sunday});

  factory PlaceOpeningHoursModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceOpeningHoursModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOpeningHoursModelToJson(this);
}
