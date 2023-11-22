import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_element.dart';
import 'package:i_table/features/place_plan/domain/entity/place_plan/plan_level.dart';
import 'package:i_table/features/place_plan/domain/entity/place_reservation/place_reservation.dart';

import '../../../place_entry/data/model/place_settings/place_settings_model.dart';
import '../../../place_entry/domain/entity/place_settings.dart';

class PlaceConfigurationEntity {
  final PlaceSettings? placeSettings;
  final List<PlanLevel> placePlanLevels;
  final Stream<List<PlaceReservation>>? placeReservationsStream;

  List<PlanElement> getItems() {
    List<PlanElement> items = [];
    List<PlanElement> planElements = placePlanLevels
        .first.placePlanElements.values
        .map((e) => e.getItems())
        .expand((element) => element)
        .toList();
    List<PlanElement> otherElements = placePlanLevels
        .first.placePlanStaticElements.values
        .map((e) => e.getItems())
        .expand((element) => element)
        .toList();
    items.addAll(planElements);
    items.addAll(otherElements);
    return items;
  }

  PlaceConfigurationEntity(
      this.placeSettings, this.placePlanLevels, this.placeReservationsStream);
}
