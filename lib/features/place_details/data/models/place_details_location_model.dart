import 'package:json_annotation/json_annotation.dart';

part 'place_details_location_model.g.dart';

@JsonSerializable()
class PlaceDetailsLocationModel {
  @JsonKey(required: true)
  final String latitude;
  @JsonKey(required: true)
  final String longitude;

  PlaceDetailsLocationModel({required this.latitude, required this.longitude});

  factory PlaceDetailsLocationModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsLocationModelToJson(this);
}
