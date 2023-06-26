
import 'package:i_table/core/util/string_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_plan_element_entity.g.dart';

@JsonSerializable()
class RestaurantPlanElementEntity {

  @JsonKey(includeFromJson: false, includeToJson: false)
  late String id;

  final String type;
  final String name;
  final int columnStart;
  final int columnSpan;
  final int rowStart;
  final int rowSpan;
  final String color;

  @JsonKey(defaultValue: StringUtil.EMPTY)
  String connectedTable = StringUtil.EMPTY;
  @JsonKey(defaultValue: <String>[])
  List<String> connectedSittings = [];

  @JsonKey(defaultValue: true)
  bool canReserveTable = false;
  @JsonKey(defaultValue: <String, List<String>>{})
  Map<String, List<String>> groupedSittings = {};

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool reserved = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool selected = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool highlighted = false;

  RestaurantPlanElementEntity({required this.type, required this.name, required this.columnStart, required this.columnSpan, required this.rowStart, required this.rowSpan, required this.color});

  factory RestaurantPlanElementEntity.fromJson(Map<String, dynamic> json){
    RestaurantPlanElementEntity planElementEntity = _$RestaurantPlanElementEntityFromJson(json);
   // planElementEntity.id = id;
    return planElementEntity;
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> jsonMap = _$RestaurantPlanElementEntityToJson(this);

    return <String, dynamic>{
     id: jsonMap
    };
  }

  void select(){
    if(reserved == false) {
      selected = !selected;

      if (selected) {
        highlighted = true;
      }
    }
  }

  void highlight(){
    if(reserved == false) {
      highlighted = !highlighted;
    }
  }

  void setSelected(bool select) {
    this.selected = select;
  }

  PlanElementState getElementState(){

    if(reserved){
      return PlanElementState.reserved;
    }

    if(selected){
      return PlanElementState.selected;
    }

    if(highlighted){
      return PlanElementState.highlighted;
    }

    return PlanElementState.notReserved;
  }

  bool isExcluded(){
    return (selected || reserved) == false;
  }

  void setHighlighted(bool highlighted) {
    this.highlighted = highlighted;
  }




}

enum PlanElementState { reserved, selected, highlighted, notReserved}