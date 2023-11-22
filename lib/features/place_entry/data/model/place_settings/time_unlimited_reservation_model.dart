import 'package:json_annotation/json_annotation.dart';

part 'time_unlimited_reservation_model.g.dart';

@JsonSerializable()
class TimeUnlimitedReservationModel {
  @JsonKey(defaultValue: true)
  final bool canReserveBeforeAnotherReservation;
  @JsonKey(defaultValue: 120)
  final int reserveBeforeAnotherReservationInterval;

  TimeUnlimitedReservationModel(
      {required this.canReserveBeforeAnotherReservation,
      required this.reserveBeforeAnotherReservationInterval});

  factory TimeUnlimitedReservationModel.fromJson(Map<String, dynamic> json) =>
      _$TimeUnlimitedReservationModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeUnlimitedReservationModelToJson(this);
}
