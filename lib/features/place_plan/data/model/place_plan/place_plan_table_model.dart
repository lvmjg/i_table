import 'package:i_table/features/place_plan/data/model/place_plan/place_plan_element_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_plan_table_model.g.dart';

@JsonSerializable()
class PlacePlanTableModel extends PlacePlanElementModel {
  @JsonKey(defaultValue: true)
  final bool allowReservation;
  @JsonKey(defaultValue: true)
  final bool exclusiveReserve;
  @JsonKey(defaultValue: <String, List<String>>{})
  final Map<String, List<String>> groups;

  PlacePlanTableModel(
      {required this.allowReservation,
      required this.exclusiveReserve,
      required this.groups,
      required super.type,
      required super.name,
      required super.columnStart,
      required super.columnSpan,
      required super.rowStart,
      required super.rowSpan,
      required super.color});

  factory PlacePlanTableModel.fromJson(Map<String, dynamic> json) =>
      _$PlacePlanTableModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlacePlanTableModelToJson(this);
}
