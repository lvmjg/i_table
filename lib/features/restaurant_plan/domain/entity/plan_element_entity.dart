
import 'package:json_annotation/json_annotation.dart';

part 'plan_element_entity.g.dart';

@JsonSerializable()
class PlanElementEntity {

  @JsonKey(includeFromJson: false, includeToJson: false)
  late String id;

  final String type;
  final String name;
  final int columnStart;
  final int columnSpan;
  final int rowStart;
  final int rowSpan;
  final String color;

  List<String> connectedSittngs = [];

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool reserved = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool selected = false;

  PlanElementEntity({required this.type, required this.name, required this.columnStart, required this.columnSpan, required this.rowStart, required this.rowSpan, required this.color});

  factory PlanElementEntity.fromJson(String id, Map<String, dynamic> json){
    PlanElementEntity planElementEntity = _$PlanElementEntityFromJson(json);
    planElementEntity.id = id;
    return planElementEntity;
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> jsonMap = _$PlanElementEntityToJson(this);

    return <String, dynamic>{
     id: jsonMap
    };
  }

}