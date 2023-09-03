import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_element.dart';
import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_state.dart';

import '../place_reservation/place_reservation.dart';

enum PlanElementsGroupType{
  table, sittingGroup, sitting, other
}

abstract class PlanElementsGroup {

  String get id;
  PlanState groupState = PlanState.notReserved;

  PlanState get state => groupState;

  bool isEdited(String elementId);

  void tap(String elementId);

  bool containsElement(String elementId);

  String getInUserFriendlyFormat();

  Map<String, dynamic> getInReservationFormat();

  List<PlanElement> getItems();

  bool get isReserved;

  void unreserve(String elementId);

  void potentiallyReserve(String elementId);

  PlanElementsGroupType getGroupType();

  void validateAgainstReservation(PlaceReservation reservation);
}






