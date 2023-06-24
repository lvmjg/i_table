import 'package:json_annotation/json_annotation.dart';

part 'reservation_entity.g.dart';

@JsonSerializable()
class ReservationEntity{

  @JsonKey(required: true)
  String restaurantId;

  @JsonKey(required:true)
  String userId;

  @JsonKey(required: true)
  DateTime reservationStart;

  @JsonKey(required: true)
  DateTime reservationEnd;

  @JsonKey(required: true)
  int numberOfPeople;

  @JsonKey(required: true)
  List<String> sittings;

  ReservationEntity({
    required this.restaurantId,
    required this.userId,
    required this.reservationStart,
    required this.reservationEnd,
    required this.numberOfPeople,
    required this.sittings
  });

  factory ReservationEntity.fromJson(Map<String, dynamic> json) =>
      _$ReservationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationEntityToJson(this);

}