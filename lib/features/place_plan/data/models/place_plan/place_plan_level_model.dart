import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/features/place_plan/data/models/place_plan/place_plan_element_model.dart';
import 'package:i_table/features/place_plan/data/models/place_plan/place_plan_sitting_model.dart';
import 'package:i_table/features/place_plan/data/models/place_plan/place_plan_table_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_plan_level_model.g.dart';

@JsonSerializable()
class PlacePlanLevelModel {
  @JsonKey(defaultValue: StringUtil.EMPTY)
  final String placePlanLevelId;
  @JsonKey(defaultValue: StringUtil.EMPTY)
  final String placePlanLevelName;
  @JsonKey(defaultValue: 0)
  final int placePlanLevelOrder;
  @JsonKey(defaultValue: <String, PlacePlanSittingModel>{})
  final Map<String, PlacePlanTableModel> placePlanTables;
  @JsonKey(defaultValue: <String, PlacePlanSittingModel>{})
  final Map<String, PlacePlanSittingModel> placePlanSittings;
  @JsonKey(defaultValue: <String, PlacePlanElementModel>{})
  final Map<String, PlacePlanElementModel> placePlanOthers;

  PlacePlanLevelModel({
    required this.placePlanLevelId,
    required this.placePlanLevelName,
    required this.placePlanLevelOrder,
    required this.placePlanTables,
    required this.placePlanSittings,
    required this.placePlanOthers,
  });

  factory PlacePlanLevelModel.fromJson(Map<String, dynamic> json) =>
      _$PlacePlanLevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlacePlanLevelModelToJson(this);
}
