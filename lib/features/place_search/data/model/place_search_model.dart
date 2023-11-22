import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/features/place_search/data/model/place_address_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_search_model.g.dart';

@JsonSerializable()
class PlaceSearchModel {
  @JsonKey(includeFromJson: false, includeToJson: false)
  late String placeId;

  @JsonKey(defaultValue: StringUtil.EMPTY)
  final String placeName;

  final PlaceAddressModel placeAddress;

  PlaceSearchModel({required this.placeName, required this.placeAddress});

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
