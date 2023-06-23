import 'package:i_table/features/restaurant_details/domain/entity/restaurant_address_entity.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_location_entity.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_opening_hours_entity.dart';
import 'package:i_table/features/search/domain/entity/search_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_details_entity.g.dart';

@JsonSerializable()
class RestaurantDetailsEntity {
  @JsonKey(required: true)
  final String restaurantId;

  @JsonKey(required: true)
  final String restaurantLogo;

  @JsonKey(required: true)
  final String restaurantName;
  @JsonKey(required: true)
  final RestaurantAddressEntity restaurantAddress;
  @JsonKey(required: true)
  final String restaurantDescription;

  @JsonKey(required: true)
  final RestaurantOpeningHoursEntity restaurantOpeningHours;

  @JsonKey(required: true)
  final String restaurantUrl;
  @JsonKey(required: true)
  final RestaurantLocationEntity restaurantLocation;

  String get restaurantLocationUrl => 'https://maps.google.com/maps?q=${restaurantLocation.latitude},${restaurantLocation.longitude}';

  RestaurantDetailsEntity({
    required this.restaurantId,
    required this.restaurantLogo,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.restaurantDescription,
    required this.restaurantOpeningHours,
    required this.restaurantUrl,
    required this.restaurantLocation,
  });

  factory RestaurantDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantDetailsEntityToJson(this);

  SearchEntity toSearchEntity(){
    SearchEntity searchEntity = SearchEntity(restaurantName: restaurantName, restaurantAddress: restaurantAddress);
    searchEntity.restaurantId = restaurantId;
    return searchEntity;
  }

}
