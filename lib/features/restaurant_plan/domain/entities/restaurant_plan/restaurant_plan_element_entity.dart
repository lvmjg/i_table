
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
  final String connectedTable;

  @JsonKey(defaultValue: <String>[])
  final List<String> connectedSittings;


  @JsonKey(includeFromJson: false, includeToJson: false)
  bool reserved = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool selected = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool highlighted = false;



  RestaurantPlanElementEntity({required this.type, required this.name, required this.columnStart, required this.columnSpan, required this.rowStart, required this.rowSpan, required this.color, required this.connectedTable, required this.connectedSittings});

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
    selected = !selected;
  }


  void forceSelect(){
    selected = true;
  }

  void highlight(){
    if(highlighted){
      selected = false;
    }

    highlighted = !highlighted;


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


}

enum PlanElementState { reserved, selected, highlighted, notReserved}