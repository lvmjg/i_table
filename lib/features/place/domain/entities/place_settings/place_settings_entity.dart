
import 'package:i_table/features/place/domain/entities/place_settings/time_restricted_reservation.dart';
import 'package:i_table/features/place/domain/entities/place_settings/time_unlimited_reservation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_settings_entity.g.dart';

@JsonSerializable()
class PlaceSettingsEntity{

  @JsonKey(required: true)
  late String placeId;

  @JsonKey(defaultValue: 1)
  late int maxReservationsPerUser;
  @JsonKey(defaultValue: 4)
  late int maxNumberOfSittingsPerUser;

  @JsonKey(required: true)
  late int reservationInterval;

  late TimeRestrictedReservationEntity timeRestrictedReservation;

  late TimeUnlimitedReservationEntity timeUnlimitedReservation;

  PlaceSettingsEntity({required this.placeId, required this.maxReservationsPerUser, required this.maxNumberOfSittingsPerUser, required this.reservationInterval, required this.timeRestrictedReservation, required this.timeUnlimitedReservation});

  factory PlaceSettingsEntity.fromJson(String placeId, Map<String, dynamic> json) => _$PlaceSettingsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceSettingsEntityToJson(this);

}