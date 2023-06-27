import 'package:i_table/features/place_details/domain/entity/place_details_address_entity.dart';
import 'package:i_table/features/place_details/domain/entity/place_details_location_entity.dart';
import 'package:i_table/features/place_details/domain/entity/place_details_opening_hours_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../place_search/domain/entities/place_search_entity.dart';

part 'place_details_entity.g.dart';

@JsonSerializable()
class PlaceDetailsEntity {
  @JsonKey(required: true)
  final String placeId;

  @JsonKey(required: true)
  final String placeLogo;

  @JsonKey(required: true)
  final String placeName;
  @JsonKey(required: true)
  final PlaceDetailsAddressEntity placeAddress;
  @JsonKey(required: true)
  final String placeDescription;

  @JsonKey(required: true)
  final PlaceDetailsOpeningHoursEntity placeOpeningHours;

  @JsonKey(required: true)
  final String placeUrl;
  @JsonKey(required: true)
  final PlaceDetailsLocationEntity placeLocation;

  String get placeLocationUrl => 'https://maps.google.com/maps?q=${placeLocation.latitude},${placeLocation.longitude}';

  PlaceDetailsEntity({
    required this.placeId,
    required this.placeLogo,
    required this.placeName,
    required this.placeAddress,
    required this.placeDescription,
    required this.placeOpeningHours,
    required this.placeUrl,
    required this.placeLocation,
  });

  factory PlaceDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsEntityToJson(this);

  PlaceSearchEntity toSearchEntity(){
    PlaceSearchEntity searchEntity = PlaceSearchEntity(placeName: placeName, placeAddress: placeAddress);
    searchEntity.placeId = placeId;
    return searchEntity;
  }

}
