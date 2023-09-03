import 'package:dartz/dartz_unsafe.dart';
import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_element.dart';
import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_elements_group.dart';
import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_sitting.dart';
import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_state.dart';

import '../../../../../core/util/string_util.dart';
import '../place_reservation/place_reservation.dart';

class PlanSittingGroup extends PlanElementsGroup {

  final Map<String, PlanSitting> sittings;

  PlanSittingGroup({required this.id, required this.sittings});



  @override
  final String id;

  @override
  bool isEdited(String elementId) => groupState == PlanState.highlighted;

  @override
  bool containsElement(String elementId) {
    return sittings.containsKey(elementId);
  }

  @override
  Map<String, dynamic> getInReservationFormat() {
    List<String> selectedSittingsToReserve = sittings.values.where((sitting) =>
    sitting.lastState == PlanState.selected).map((sitting) => sitting.id).toList();

    if(groupState == PlanState.potentiallyReserved && selectedSittingsToReserve.isNotEmpty) {
      //groupId : [S1, S2]
      Map<String, dynamic> formattedGroup = {
        id: selectedSittingsToReserve
      };
      return formattedGroup;
    }

    return {};
  }

  @override
  String getInUserFriendlyFormat() {
    // TODO: implement getInUserFriendlyFormat
    throw UnimplementedError();
  }

  @override
  List<PlanElement> getItems() {
    return sittings.values.map((e) => e).toList();
  }

  @override
  void tap(String elementId) {
    PlanSitting tappedSitting = getSitting(elementId);
    tappedSitting.tap(StringUtil.EMPTY);

    if (groupState == PlanState.notReserved) {
      highlightOtherSittings(elementId);

      groupState = PlanState.highlighted;
    } else if (groupState == PlanState.highlighted) {
      int numberOfSelectedSittings = sittings.values
          .where((sitting) => sitting.state == PlanState.selected)
          .toList()
          .length;
      bool allSittingsSelected = numberOfSelectedSittings == sittings.length;

      if (allSittingsSelected) {
        potentiallyReserve(StringUtil.EMPTY);
      }
      else if(numberOfSelectedSittings == 0){
        unreserve(StringUtil.EMPTY);
      }
    } else if (groupState == PlanState.potentiallyReserved) {
      recallOtherSittingsState(elementId);

      groupState = PlanState.highlighted;
    }
  }

  @override
  void potentiallyReserve(String elementId) {
    potentiallyReserveAllSittings();

    groupState = PlanState.potentiallyReserved;
  }

  @override
  void unreserve(String elementId) {
    unreserveAllSittings();

    groupState = PlanState.notReserved;
  }

  @override
  void validateAgainstReservation(PlaceReservation reservation) {
    reserveAllSittings();

    groupState = PlanState.reserved;
  }

  @override
  PlanElementsGroupType getGroupType() {
    return PlanElementsGroupType.sittingGroup;
  }

  @override
  bool get isReserved => areAllSittingsReserved();

  PlanSitting getSitting(String elementId) {
    return sittings.values
        .where((sitting) => sitting.containsElement(elementId))
        .toList()
        .first;
  }

  List<PlanSitting> getOtherSittings(String elementId) {
    return sittings.values
        .where((sitting) => !sitting.containsElement(elementId))
        .toList();
  }


  void highlightOtherSittings(String elementId) {
    List<PlanSitting> otherSittings = getOtherSittings(elementId);
    otherSittings
        .forEach((sitting) => sitting.state = PlanState.highlighted);
  }

  void selectOtherSittings(String elementId) {
    List<PlanSitting> otherSittings = getOtherSittings(elementId);
    otherSittings
        .forEach((sitting) => sitting.state = PlanState.selected);
  }

  void recallOtherSittingsState(String elementId) {
    getOtherSittings(elementId)
        .forEach((sitting) => sitting.recallPreviousState());
  }


  void unreserveAllSittings() {
    sittings.values
        .forEach((sitting) => sitting.state = PlanState.notReserved);
  }

  void highlightAllSittings() {
    sittings.values
        .forEach((sitting) => sitting.state = PlanState.highlighted);
  }

  void potentiallyReserveAllSittings() {
    sittings.values
        .forEach((sitting) => sitting.state = PlanState.potentiallyReserved);
  }

  void reserveAllSittings() {
    sittings.values
        .forEach((sitting) => sitting.state = PlanState.reserved);
  }


  bool areAllSittingsSelected() {
    return sittings.values.every((sitting) => sitting.state == PlanState.selected || sitting.state == PlanState.potentiallyReserved);
  }

  bool isAnySittingSelected() {
    return sittings.values.any((sitting) => sitting.state == PlanState.selected || sitting.state == PlanState.potentiallyReserved);
  }

  bool areAllSittingsReserved() {
    return sittings.values.every((sitting) => sitting.state == PlanState.reserved);
  }
}