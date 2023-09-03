import 'package:json_annotation/json_annotation.dart';

part 'place_work_day_model.g.dart';

@JsonSerializable()
class PlaceWorkDayModel {
  @JsonKey(required: true)
  final String open;
  @JsonKey(required: true)
  final String close;

  PlaceWorkDayModel({required this.open, required this.close});

  factory PlaceWorkDayModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceWorkDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceWorkDayModelToJson(this);
}
