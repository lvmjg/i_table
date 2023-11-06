import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_state.dart';

class PlanElement {
  final String type;
  final String name;
  final int columnStart;
  final int columnSpan;
  final int rowStart;
  final int rowSpan;
  final String color;

  PlanState localState = PlanState.notReserved;

  PlanElement(
      {required this.type,
      required this.name,
      required this.columnStart,
      required this.columnSpan,
      required this.rowStart,
      required this.rowSpan,
      required this.color});
}
