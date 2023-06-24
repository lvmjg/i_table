
import 'package:i_table/features/restaurant_plan/domain/entities/restaurant_configuration/time_restricted_reservation.dart';
import 'package:i_table/features/restaurant_plan/domain/entities/restaurant_configuration/time_unlimited_reservation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_configuration_entity.g.dart';

@JsonSerializable()
class RestaurantConfigurationEntity{

  @JsonKey(required: true)
  late String restaurantId;

  @JsonKey(defaultValue: 1)
  late int maxReservationsPerUser;
  @JsonKey(defaultValue: 4)
  late int maxNumberOfSittingsPerUser;

  @JsonKey(required: true)
  late int reservationInterval;

  late TimeRestrictedReservationEntity timeRestrictedReservation;

  late TimeUnlimitedReservationEntity timeUnlimitedReservation;

  RestaurantConfigurationEntity({required this.restaurantId, required this.maxReservationsPerUser, required this.maxNumberOfSittingsPerUser, required this.reservationInterval, required this.timeRestrictedReservation, required this.timeUnlimitedReservation});

  factory RestaurantConfigurationEntity.fromJson(String restaurantId, Map<String, dynamic> json) => _$RestaurantConfigurationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantConfigurationEntityToJson(this);

}