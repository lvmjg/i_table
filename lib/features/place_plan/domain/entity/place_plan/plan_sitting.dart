import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_element.dart';
import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_elements_group.dart';
import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_state.dart';

import '../place_reservation/place_reservation.dart';

class PlanSitting extends PlanElement with PlanElementsGroup {

  final bool isAlone;

  PlanState lastState = PlanState.notReserved;

  //final PlanSittingGroup? group;
 //final PlanTable? table;

  PlanSitting(
      {required this.id,
        required this.isAlone,
      //  required this.group,
      //  required this.table,
        required super.type,
        required super.name,
        required super.columnStart,
        required super.columnSpan,
        required super.rowStart,
        required super.rowSpan,
        required super.color});

  @override
  PlanState get state => localState;

  set state(PlanState newState){
    if(newState == PlanState.potentiallyReserved){
      lastState = localState;
    }

    localState = newState;
  }

  @override
  final String id;

  @override
  bool isEdited(String elementId) => false;

  @override
  bool containsElement(String elementId) {
    return id == elementId;
  }

  @override
  Map<String, dynamic> getInReservationFormat() {
    if(localState == PlanState.potentiallyReserved){
      return {'id':id};
    }

    return {};
  }

  @override
  String getInUserFriendlyFormat() {
    // TODO: implement getInUserFriendlyFormat
    throw UnimplementedError();
  }

  @override
  void tap(String elementId) {
    if (isAlone) {
      if (state == PlanState.notReserved) {
        state = PlanState.potentiallyReserved;
      }
      else{
        state = PlanState.notReserved;
      }
    } else {
      if(state == PlanState.potentiallyReserved){
        if(lastState == PlanState.selected) {
          lastState = PlanState.highlighted;
        }

        state = lastState;
      }
      else if (state == PlanState.selected) {
        state = PlanState.highlighted;
      }
      else if (state == PlanState.highlighted) {
        state = PlanState.selected;
      }
      else if (state == PlanState.notReserved) {
        state = PlanState.selected;
      }
      else{
        state = PlanState.notReserved;
      }
    }
  }

  @override
  List<PlanElement> getItems() {
    return [this];
  }

  @override
  void potentiallyReserve(String elementId) {
    localState = PlanState.potentiallyReserved;
  }

  @override
  void unreserve(String elementId) {
    localState = PlanState.notReserved;
  }

  @override
  PlanElementsGroupType getGroupType() {
    return PlanElementsGroupType.sitting;
  }

  @override
  void validateAgainstReservation(PlaceReservation reservation) {
    localState = PlanState.reserved;
  }

  @override
  bool get isReserved => state == PlanState.reserved;

  void recallPreviousState(){
    localState = lastState;
  }


}