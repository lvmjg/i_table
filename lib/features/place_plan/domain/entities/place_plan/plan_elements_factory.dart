

import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_elements_group.dart';
import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_other.dart';
import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_sitting.dart';
import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_sitting_group.dart';
import 'package:i_table/features/place_plan/domain/entities/place_plan/plan_table.dart';

import '../../../data/models/place_plan/place_plan_level_model.dart';

class PlanElementsFactory {
  Map<String, PlanElementsGroup> getStaticElements(
      List<PlacePlanLevelModel> placePlanLevelModels) {
    Map<String, PlanElementsGroup> otherElements = {};

    placePlanLevelModels.first.placePlanOthers.entries.forEach((entry) {
      otherElements.putIfAbsent(
          entry.key,
          () => PlanOther(
                id: entry.key,
                type: entry.value.type,
                name: entry.value.name,
                columnStart: entry.value.columnStart,
                columnSpan: entry.value.columnSpan,
                rowStart: entry.value.rowStart,
                rowSpan: entry.value.rowSpan,
                color: entry.value.color,
              ));
    });

    return otherElements;
  }

  Map<String, PlanElementsGroup> getAloneSittings(
      List<PlacePlanLevelModel> placePlanLevelModels) {
    Map<String, PlanElementsGroup> aloneSittings = {};

    placePlanLevelModels.first.placePlanSittings.entries
        .where((entry) => entry.value.isAlone)
        .forEach((entry) {
      aloneSittings.putIfAbsent(
          entry.key,
          () => PlanSitting(
              id: entry.key,
              isAlone: true,
              type: entry.value.type,
              name: entry.value.name,
              columnStart: entry.value.columnStart,
              columnSpan: entry.value.columnSpan,
              rowStart: entry.value.rowStart,
              rowSpan: entry.value.rowSpan,
              color: entry.value.color));
    });

    return aloneSittings;
  }

  Map<String, PlanElementsGroup> getAloneSittingGroups(
      List<PlacePlanLevelModel> placePlanLevelModels) {
    Map<String, PlanElementsGroup> aloneSittingGroups = {};

    placePlanLevelModels.first.placePlanSittings.entries
        .where((entry) =>
            entry.value.group.isNotEmpty && entry.value.table.isEmpty)
        .forEach((entry) {
      String groupId = entry.value.group;
      PlanElementsGroup group;
      bool isInGroups = aloneSittingGroups.containsKey(groupId);
      if (isInGroups) {
        group = aloneSittingGroups[groupId]!;
      } else {
        group = PlanSittingGroup(id: groupId, sittings: {});
        aloneSittingGroups.putIfAbsent(groupId, () => group);
      }

      (group as PlanSittingGroup).sittings.putIfAbsent(
          entry.key,
          () => PlanSitting(
              id: entry.key,
              isAlone: entry.value.isAlone,
              type: entry.value.type,
              name: entry.value.name,
              columnStart: entry.value.columnStart,
              columnSpan: entry.value.columnSpan,
              rowStart: entry.value.rowStart,
              rowSpan: entry.value.rowSpan,
              color: entry.value.color,
              //group: groupId,
              //table: entry.value.table
          ));
    });

    return aloneSittingGroups;
  }

  Map<String, PlanElementsGroup> getTables(
      List<PlacePlanLevelModel> placePlanLevelModels) {
    Map<String, PlanElementsGroup> tables = {};

    placePlanLevelModels.first.placePlanTables.entries.forEach((entry) {
      List<PlanSittingGroup> tableSittingGroups =
          getTableSittingGroups(entry.key, placePlanLevelModels)
              .values
              .toList();

      tables.putIfAbsent(
          entry.key,
          () => PlanTable(
              id: entry.key,
              type: entry.value.type,
              name: entry.value.name,
              columnStart: entry.value.columnStart,
              columnSpan: entry.value.columnSpan,
              rowStart: entry.value.rowStart,
              rowSpan: entry.value.rowSpan,
              color: entry.value.color,
              groups: tableSittingGroups,
              allowReservation: entry.value.allowReservation,
              exclusiveReserve: entry.value.exclusiveReserve));
    });

    return tables;
  }

  Map<String, PlanSittingGroup> getTableSittingGroups(
      String tableId, List<PlacePlanLevelModel> placePlanLevelModels) {
    Map<String, PlanSittingGroup> tableSittingGroups = {};

    placePlanLevelModels.first.placePlanSittings.entries
        .where((entry) =>
            entry.value.group.isNotEmpty &&
            entry.value.table.isNotEmpty &&
            entry.value.table == tableId)
        .forEach((entry) {
      String groupId = entry.value.group;
      PlanSittingGroup group;
      bool isInGroups = tableSittingGroups.containsKey(groupId);
      if (isInGroups) {
        group = tableSittingGroups[groupId]!;
      } else {
        group = PlanSittingGroup(id: groupId, sittings: {});
        tableSittingGroups.putIfAbsent(groupId, () => group);
      }

      group.sittings.putIfAbsent(
          entry.key,
          () => PlanSitting(
              id: entry.key,
              isAlone: entry.value.isAlone,
              type: entry.value.type,
              name: entry.value.name,
              columnStart: entry.value.columnStart,
              columnSpan: entry.value.columnSpan,
              rowStart: entry.value.rowStart,
              rowSpan: entry.value.rowSpan,
              color: entry.value.color,
              //group: groupId,
              //table: entry.value.table
          ));
    });

    return tableSittingGroups;
  }
}
