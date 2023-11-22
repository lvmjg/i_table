import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_element.dart';
import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_elements_group.dart';
import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_sitting_group.dart';
import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_state.dart';

import '../../../../../core/util/string_util.dart';
import '../place_reservation/place_reservation.dart';

class PlanTable extends PlanElement with PlanElementsGroup {
  @override
  final String id;
  final bool allowReservation;
  final bool exclusiveReserve;

  final List<PlanSittingGroup> groups;

  PlanTable({
    required this.id,
    required this.allowReservation,
    required this.exclusiveReserve,
    required this.groups,
    required super.type,
    required super.name,
    required super.columnStart,
    required super.columnSpan,
    required super.rowStart,
    required super.rowSpan,
    required super.color,
  });

  @override
  PlanState get state => localState;

  @override
  bool isEdited(elementId) {
    if (elementId == id) {
      return localState == PlanState.selected;
    }

    return groups.any((group) =>
        group.containsElement(elementId) && group.isEdited(elementId));
  }

  @override
  bool containsElement(String elementId) {
    if (id == elementId) {
      return true;
    }

    return groups
        .any((sittingGroup) => sittingGroup.containsElement(elementId));
  }

  @override
  Map<String, Map<String, List<String>>> getInReservationFormat() {
    Map<String, List<String>> groupsToReserve = {};
    groups.forEach((sittingGroup) {
      try {
        groupsToReserve.addAll(sittingGroup.getInReservationFormat());
      } catch (e, s) {
        print('test');
      }
    });

    if (localState == PlanState.potentiallyReserved) {
      //tableId : { groupId: [S1, S2]}
      Map<String, Map<String, List<String>>> formattedTable = {
        id: groupsToReserve
      };
      return formattedTable;
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
    bool tableTapped = id == elementId;
    if (tableTapped) {
      if (allowReservation) {
        if (localState == PlanState.notReserved) {
          localState = PlanState.selected;

          groups.forEach((sittingGroup) => sittingGroup.highlightAllSittings());
        } else {
          localState = PlanState.notReserved;

          groups.forEach(
              (sittingGroup) => sittingGroup.unreserve(StringUtil.EMPTY));
        }
      }
    } else {
      PlanSittingGroup tappedGroup = groups
          .where((sittingGroup) => sittingGroup.containsElement(elementId))
          .toList()
          .first;
      tappedGroup.tap(elementId);

      if (allowReservation) {
        bool anyGroupSelected =
            groups.any((sittingGroup) => sittingGroup.areAllSittingsSelected());
        if (anyGroupSelected) {
          localState = PlanState.potentiallyReserved;

          groups
              .where((group) => group.isAnySittingSelected() == false)
              .forEach((group) => group.unreserve(StringUtil.EMPTY));
        } else {
          bool anySittingSelected =
              groups.any((sittingGroup) => sittingGroup.isAnySittingSelected());
          if (anySittingSelected) {
            localState = PlanState.selected;
          } else {
            localState = PlanState.notReserved;
          }
        }
      }
    }
  }

  @override
  List<PlanElement> getItems() {
    List<PlanElement> items = [];
    items.add(this);
    groups.forEach((element) {
      items.addAll(
          element.sittings.values.map((e) => e as PlanElement).toList());
    });
    return items;
  }

  @override
  void potentiallyReserve(String elementId) {
    if (allowReservation && exclusiveReserve) {
      localState = PlanState.potentiallyReserved;

      List<PlanSittingGroup> groupsToReserve = [];

      bool isTable = id == elementId;
      if (isTable) {
        groupsToReserve = groups;
      } else {
        groupsToReserve = groups
            .where((element) => element.containsElement(elementId))
            .toList();
      }

      if (groupsToReserve.isNotEmpty) {
        groupsToReserve.forEach((group) => group.potentiallyReserve(elementId));
      }
    }
  }

  @override
  void unreserve(String elementId) {
    if (allowReservation && exclusiveReserve) {
      localState = PlanState.notReserved;

      List<PlanSittingGroup> groupsToReserve = [];

      bool isTable = id == elementId;
      if (isTable) {
        groupsToReserve = groups;
      } else {
        groupsToReserve = groups
            .where((element) => element.containsElement(elementId))
            .toList();
      }

      if (groupsToReserve.isNotEmpty) {
        groupsToReserve.forEach((group) => group.unreserve(elementId));
      }
    }
  }

  @override
  PlanElementsGroupType getGroupType() {
    return PlanElementsGroupType.table;
  }

  @override
  void validateAgainstReservation(PlaceReservation reservation) {
    Map<String, dynamic>? groupsMap = reservation.tables[id];
    if (groupsMap != null) {
      //whole table was reserved but user not pointed sittings
      if (groupsMap.isEmpty) {
        groups.forEach((group) {
          group.validateAgainstReservation(reservation);
        });
      } else {
        groupsMap.keys.forEach((groupId) {
          List<PlanSittingGroup> foundGroups =
              groups.where((group) => group.id == groupId).toList();
          if (foundGroups.isNotEmpty) {
            (foundGroups.first as PlanElementsGroup)
                .validateAgainstReservation(reservation);
          } else {
            //error
          }
        });
      }
    }

    localState = PlanState.reserved;
  }

  @override
  bool get isReserved => groups.any((group) => group.areAllSittingsReserved());
}
