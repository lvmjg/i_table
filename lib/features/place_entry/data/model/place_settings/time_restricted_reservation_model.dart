import 'package:json_annotation/json_annotation.dart';

part 'time_restricted_reservation_model.g.dart';

@JsonSerializable()
class TimeRestrictedReservationModel {
  @JsonKey(defaultValue: 120)
  final int maxReservationDuration;
  @JsonKey(defaultValue: 60)
  final int minReservationDuration;
  @JsonKey(defaultValue: 60)
  final int reservationDefaultDuration;
  @JsonKey(defaultValue: 60)
  final int reservationDurationInterval;

  TimeRestrictedReservationModel(
      {required this.maxReservationDuration,
      required this.minReservationDuration,
      required this.reservationDefaultDuration,
      required this.reservationDurationInterval});

  factory TimeRestrictedReservationModel.fromJson(Map<String, dynamic> json) =>
      _$TimeRestrictedReservationModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeRestrictedReservationModelToJson(this);
}
