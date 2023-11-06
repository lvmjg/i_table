import 'package:i_table/core/util/string_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_plan_element_model.g.dart';

@JsonSerializable()
class PlacePlanElementModel {
  @override
  @JsonKey(defaultValue: StringUtil.EMPTY)
  final String type;
  @override
  @JsonKey(defaultValue: StringUtil.EMPTY)
  final String name;
  @override
  @JsonKey(defaultValue: 0)
  final int columnStart;
  @override
  @JsonKey(defaultValue: 0)
  final int columnSpan;
  @override
  @JsonKey(defaultValue: 0)
  final int rowStart;
  @override
  @JsonKey(defaultValue: 0)
  final int rowSpan;
  @override
  @JsonKey(defaultValue: '#FFFFFF')
  final String color;

  factory PlacePlanElementModel.fromJson(Map<String, dynamic> json) =>
      _$PlacePlanElementModelFromJson(json);

  PlacePlanElementModel(
      {required this.type,
      required this.name,
      required this.columnStart,
      required this.columnSpan,
      required this.rowStart,
      required this.rowSpan,
      required this.color});

  Map<String, dynamic> toJson() => _$PlacePlanElementModelToJson(this);
}
