import 'package:i_table/features/place/domain/entities/place_plan/place_plan_level_entity.dart';
import 'package:i_table/features/place/domain/entities/place_settings/place_settings_entity.dart';

class PlaceConfigurationEntity {
  final PlaceSettingsEntity? placeSettings;
  final List<PlacePlanLevelEntity> placePlanLevels;

  PlaceConfigurationEntity(this.placeSettings, this.placePlanLevels);
}
