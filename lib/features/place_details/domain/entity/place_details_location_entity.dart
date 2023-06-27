import 'package:json_annotation/json_annotation.dart';

part 'place_details_location_entity.g.dart';

@JsonSerializable()
class PlaceDetailsLocationEntity {
  @JsonKey(required: true)
  final String latitude;

  @JsonKey(required: true)
  final String longitude;

  PlaceDetailsLocationEntity({required this.latitude, required this.longitude});

  factory PlaceDetailsLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsLocationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsLocationEntityToJson(this);
}
