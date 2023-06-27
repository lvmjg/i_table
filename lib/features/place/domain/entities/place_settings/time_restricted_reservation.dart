import 'package:json_annotation/json_annotation.dart';

part 'time_restricted_reservation.g.dart';

@JsonSerializable()
class TimeRestrictedReservationEntity{

  @JsonKey(defaultValue: 120)
  late int maximalReservationDuration;
  @JsonKey(defaultValue: 60)
  late int minimalReservationDuration;

  TimeRestrictedReservationEntity({required this.maximalReservationDuration, required this.minimalReservationDuration});

  factory TimeRestrictedReservationEntity.fromJson(Map<String, dynamic> json) => _$TimeRestrictedReservationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TimeRestrictedReservationEntityToJson(this);
}