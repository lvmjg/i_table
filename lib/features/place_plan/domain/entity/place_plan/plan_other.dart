import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_element.dart';
import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_elements_group.dart';

import '../../../../../core/util/string_util.dart';
import '../place_reservation/place_reservation.dart';

class PlanOther extends PlanElement with PlanElementsGroup {
  PlanOther(
      {required this.id,
      required super.type,
      required super.name,
      required super.columnStart,
      required super.columnSpan,
      required super.rowStart,
      required super.rowSpan,
      required super.color});

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
    return {};
  }

  @override
  String getInUserFriendlyFormat() {
    return StringUtil.EMPTY;
  }

  @override
  List<PlanElement> getItems() {
    return [this];
  }

  @override
  void tap(String elementId) {}

  @override
  void potentiallyReserve(String elementId) {}

  @override
  void unreserve(String elementId) {}

  @override
  PlanElementsGroupType getGroupType() {
    return PlanElementsGroupType.other;
  }

  @override
  void validateAgainstReservation(PlaceReservation reservation) {}

  @override
  bool get isReserved => false;
}
