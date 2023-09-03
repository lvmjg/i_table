import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_elements_group.dart';

class PlanLevel{
  final String placePlanLevelId;
  final String placePlanLevelName;
  final int placePlanLevelOrder;

  final Map<String, PlanElementsGroup> placePlanStaticElements;
  final Map<String, PlanElementsGroup> placePlanElements;

  PlanLevel(this.placePlanLevelId, this.placePlanLevelName, this.placePlanLevelOrder, this.placePlanElements, this.placePlanStaticElements);
}