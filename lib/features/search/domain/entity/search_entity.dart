import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_entity.g.dart';

@JsonSerializable()
class SearchEntity {

  @JsonKey(required: true)
  final String restaurantId;

  @JsonKey(defaultValue: StringUtil.EMPTY)
  final String restaurantName;

  @JsonKey(defaultValue: StringUtil.EMPTY)
  final String restaurantAddress;

  SearchEntity({required this.restaurantId, required this.restaurantName, required this.restaurantAddress});

  factory SearchEntity.fromJson(Map<String, dynamic> json) => _$SearchEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchEntityToJson(this);
}