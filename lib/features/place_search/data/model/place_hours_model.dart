import 'package:json_annotation/json_annotation.dart';

part 'place_hours_model.g.dart';

@JsonSerializable()
class PlaceHoursModel {
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

  PlaceHoursModel(
      {required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.sunday});

  factory PlaceHoursModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceHoursModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceHoursModelToJson(this);
}
