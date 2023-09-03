import 'package:i_table/features/place_details/data/models/place_details_model.dart';
import 'package:i_table/features/place_details/domain/entities/place_details.dart';
import 'package:i_table/features/place_details/domain/entities/place_details_address.dart';
import 'package:i_table/features/place_details/domain/entities/place_details_location.dart';
import 'package:i_table/features/place_details/domain/entities/place_details_opening_hours.dart';

class PlaceDetailsFactory {
  PlaceDetails getPlaceDetailsFromModel(PlaceDetailsModel model) {
    return PlaceDetails(
        placeId: model.placeId,
        placeLogo: model.placeLogo,
        placeName: model.placeName,
        placeAddress: PlaceDetailsAddress(
            placeAddress:
                '${model.placeAddress.placeStreet}, ${model.placeAddress.placeCity}'),
        placeDescription: model.placeDescription,
        placeOpeningHours: PlaceDetailsOpeningHours(
            monday: model.placeOpeningHours.monday,
            tuesday: model.placeOpeningHours.tuesday,
            wednesday: model.placeOpeningHours.wednesday,
            thursday: model.placeOpeningHours.thursday,
            friday: model.placeOpeningHours.friday,
            saturday: model.placeOpeningHours.saturday,
            sunday: model.placeOpeningHours.sunday,
        ),
        placeUrl: model.placeUrl,
        placeLocation: PlaceDetailsLocation(
            latitude: model.placeLocation.latitude,
            longitude: model.placeLocation.longitude));
  }
}
