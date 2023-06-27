import 'package:i_table/core/util/string_util.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../place_details/domain/entity/place_details_address_entity.dart';

part 'place_search_entity.g.dart';

@JsonSerializable()
class PlaceSearchEntity{

  @JsonKey(includeFromJson: false, includeToJson: false)
  late String placeId;

  @JsonKey(defaultValue: StringUtil.EMPTY)
  final String placeName;

  final PlaceDetailsAddressEntity placeAddress;

  PlaceSearchEntity({required this.placeName, required this.placeAddress});

  factory PlaceSearchEntity.fromJson(String placeId, Map<String, dynamic> json){
    PlaceSearchEntity searchEntity = _$PlaceSearchEntityFromJson(json);
    searchEntity.placeId = placeId;
    return searchEntity;
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> jsonMap = _$PlaceSearchEntityToJson(this);
    jsonMap['placeId'] = placeId;
    return jsonMap;
  }

  @override
  String toString(){
    return placeAddress.placeCity;
  }
}