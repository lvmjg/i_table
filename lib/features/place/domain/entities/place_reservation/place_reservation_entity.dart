import 'package:json_annotation/json_annotation.dart';

part 'place_reservation_entity.g.dart';

@JsonSerializable()
class PlaceReservationEntity{

  @JsonKey(required: true)
  String placeId;

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

  PlaceReservationEntity({
    required this.placeId,
    required this.userId,
    required this.reservationStart,
    required this.reservationEnd,
    required this.numberOfPeople,
    required this.sittings
  });

  factory PlaceReservationEntity.fromJson(Map<String, dynamic> json) =>
      _$PlaceReservationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceReservationEntityToJson(this);

}