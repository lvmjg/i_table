import 'package:i_table/features/place_search/domain/entity/place_hours.dart';

class PlaceSearch {
  final String placeId;
  final String placeName;
  final String placeAddress;
  final String placeDescription;
  final PlaceHours placeHours;
  final String placeUrl;
  final String placeLocation;
  final String? imageUrl;

  PlaceSearch({
      required this.placeId,
      required this.placeName,
      required this.placeAddress,
      required this.placeDescription,
      required this.placeHours,
      required this.placeUrl,
      required this.placeLocation,
      this.imageUrl});
}

