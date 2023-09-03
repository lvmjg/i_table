import 'package:i_table/features/place_details/data/models/place_details_address_model.dart';
import 'package:i_table/features/place_details/data/models/place_details_location_model.dart';
import 'package:i_table/features/place_details/data/models/place_details_opening_hours_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_details_model.g.dart';

@JsonSerializable()
class PlaceDetailsModel {
  @JsonKey(required: true)
  final String placeId;
  @JsonKey(required: true)
  final String placeLogo;
  @JsonKey(required: true)
  final String placeName;
  @JsonKey(required: true)
  final PlaceDetailsAddressModel placeAddress;
  @JsonKey(required: true)
  final String placeDescription;
  @JsonKey(required: true)
  final PlaceDetailsOpeningHoursModel placeOpeningHours;
  @JsonKey(required: true)
  final String placeUrl;
  @JsonKey(required: true)
  final PlaceDetailsLocationModel placeLocation;

  PlaceDetailsModel({
    required this.placeId,
    required this.placeLogo,
    required this.placeName,
    required this.placeAddress,
    required this.placeDescription,
    required this.placeOpeningHours,
    required this.placeUrl,
    required this.placeLocation,
  });

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsModelToJson(this);
}
