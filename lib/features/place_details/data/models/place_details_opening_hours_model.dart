import 'package:json_annotation/json_annotation.dart';

part 'place_details_opening_hours_model.g.dart';

@JsonSerializable()
class PlaceDetailsOpeningHoursModel {
  @JsonKey(required: true)
  final String monday;
  @JsonKey(required: true)
  final String tuesday;
  @JsonKey(required: true)
  final String wednesday;
  @JsonKey(required: true)
  final String thursday;
  @JsonKey(required: true)
  final String friday;
  @JsonKey(required: true)
  final String saturday;
  @JsonKey(required: true)
  final String sunday;

  PlaceDetailsOpeningHoursModel(
      {required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.sunday});

  factory PlaceDetailsOpeningHoursModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsOpeningHoursModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsOpeningHoursModelToJson(this);
}
