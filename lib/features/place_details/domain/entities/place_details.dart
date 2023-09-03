import 'package:i_table/features/place_details/domain/entities/place_details_address.dart';
import 'package:i_table/features/place_details/domain/entities/place_details_location.dart';
import 'package:i_table/features/place_details/domain/entities/place_details_opening_hours.dart';

class PlaceDetails {
  final String placeId;
  final String placeLogo;
  final String placeName;
  final PlaceDetailsAddress placeAddress;
  final String placeDescription;
  final PlaceDetailsOpeningHours placeOpeningHours;
  final String placeUrl;
  final PlaceDetailsLocation placeLocation;

  String get placeLocationUrl => 'https://maps.google.com/maps?q=${placeLocation.latitude},${placeLocation.longitude}';

  PlaceDetails({
    required this.placeId,
    required this.placeLogo,
    required this.placeName,
    required this.placeAddress,
    required this.placeDescription,
    required this.placeOpeningHours,
    required this.placeUrl,
    required this.placeLocation,
  });
}