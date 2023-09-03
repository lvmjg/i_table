import 'package:i_table/features/place_entry/data/models/place_settings/time_restricted_reservation_model.dart';
import 'package:i_table/features/place_entry/data/models/place_settings/time_unlimited_reservation_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation_logic_model.g.dart';

@JsonSerializable()
class ReservationLogicModel {
  @JsonKey(defaultValue: 0)
  final int reservationMode;
  @JsonKey(defaultValue: 1)
  final int maxNumberOfReservationsPerUser;
  @JsonKey(defaultValue: 1)
  final int maxNumberOfSittingsPerUser;
  @JsonKey(defaultValue: 30)
  final int reservationInterval;
  @JsonKey(defaultValue: 30)
  final int reservationDaysAhead;
  final TimeRestrictedReservationModel timeRestrictedReservation;
  final TimeUnlimitedReservationModel timeUnlimitedReservation;

  ReservationLogicModel(
      {required this.reservationMode,
      required this.maxNumberOfReservationsPerUser,
      required this.maxNumberOfSittingsPerUser,
      required this.reservationInterval,
      required this.reservationDaysAhead,
      required this.timeRestrictedReservation,
      required this.timeUnlimitedReservation});

  factory ReservationLogicModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationLogicModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationLogicModelToJson(this);
}
