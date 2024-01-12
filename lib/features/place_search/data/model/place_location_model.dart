import 'package:json_annotation/json_annotation.dart';

part 'place_location_model.g.dart';

@JsonSerializable()
class PlaceLocationModel {
  @JsonKey(required: true)
  final String latitude;
  @JsonKey(required: true)
  final String longitude;

  PlaceLocationModel({required this.latitude, required this.longitude});

  factory PlaceLocationModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceLocationModelToJson(this);
}
