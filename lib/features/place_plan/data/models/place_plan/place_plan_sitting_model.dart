import 'package:i_table/features/place_plan/data/models/place_plan/place_plan_element_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/util/string_util.dart';

part 'place_plan_sitting_model.g.dart';

@JsonSerializable()
class PlacePlanSittingModel extends PlacePlanElementModel {
  @JsonKey(defaultValue: StringUtil.EMPTY)
  final String group;
  @JsonKey(defaultValue: StringUtil.EMPTY)
  final String table;

  PlacePlanSittingModel({
    required this.group,
    required this.table,
    required super.type,
    required super.name,
    required super.columnStart,
    required super.columnSpan,
    required super.rowStart,
    required super.rowSpan,
    required super.color,
  });

  factory PlacePlanSittingModel.fromJson(Map<String, dynamic> json) =>
      _$PlacePlanSittingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlacePlanSittingModelToJson(this);

  bool get isAlone => table.isEmpty && group.isEmpty;
}
