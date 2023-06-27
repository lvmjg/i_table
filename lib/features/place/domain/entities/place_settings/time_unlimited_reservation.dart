
import 'package:json_annotation/json_annotation.dart';

part 'time_unlimited_reservation.g.dart';

@JsonSerializable()
class TimeUnlimitedReservationEntity{

  @JsonKey(defaultValue: true)
  late bool canReserveBeforeAnotherReservation;
  @JsonKey(defaultValue: 120)
  late int reserveBeforeAnotherReservationInterval;

  TimeUnlimitedReservationEntity({required this.canReserveBeforeAnotherReservation, required this.reserveBeforeAnotherReservationInterval});

  factory TimeUnlimitedReservationEntity.fromJson(Map<String, dynamic> json) => _$TimeUnlimitedReservationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TimeUnlimitedReservationEntityToJson(this);
}