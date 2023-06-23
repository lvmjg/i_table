import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_address_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_entity.g.dart';

@JsonSerializable()
class SearchEntity{

  @JsonKey(includeFromJson: false, includeToJson: false)
  late String restaurantId;

  @JsonKey(defaultValue: StringUtil.EMPTY)
  final String restaurantName;

  final RestaurantAddressEntity restaurantAddress;

  SearchEntity({required this.restaurantName, required this.restaurantAddress});

  factory SearchEntity.fromJson(String restaurantId, Map<String, dynamic> json){
    SearchEntity searchEntity = _$SearchEntityFromJson(json);
    searchEntity.restaurantId = restaurantId;
    return searchEntity;
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> jsonMap = _$SearchEntityToJson(this);
    jsonMap['restaurantId'] = restaurantId;
    return jsonMap;
  }

  @override
  String toString(){
    return restaurantAddress.restaurantCity;
  }
}