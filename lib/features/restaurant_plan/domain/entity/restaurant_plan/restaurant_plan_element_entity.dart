
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

  final List<String> connectedSittngs = [];

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool reserved = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool selected = false;

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


}