import 'package:i_table/features/place_search/data/model/place_address_model.dart';
import 'package:i_table/features/place_search/data/model/place_hours_model.dart';
import 'package:i_table/features/place_search/data/model/place_location_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_search_model.g.dart';

@JsonSerializable()
class PlaceSearchModel {
  @JsonKey(includeFromJson: false, includeToJson: false)
  late String placeId;
  final String placeName;
  final PlaceAddressModel placeAddress;
  final String placeDescription;
  final PlaceHoursModel placeOpeningHours;
  final String placeUrl;
  final PlaceLocationModel placeLocation;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? imageUrl;

  PlaceSearchModel({required this.placeName, required this.placeAddress, required this.placeDescription, required this.placeOpeningHours, required this.placeUrl, required this.placeLocation});

  factory PlaceSearchModel.fromJson(String placeId, Map<String, dynamic> json) {
    PlaceSearchModel searchEntity = _$PlaceSearchModelFromJson(json);
    searchEntity.placeId = placeId;
    return searchEntity;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = _$PlaceSearchModelToJson(this);
    jsonMap['placeId'] = placeId;
    return jsonMap;
  }
}
