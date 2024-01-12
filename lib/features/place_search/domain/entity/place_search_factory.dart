import 'package:i_table/features/place_search/domain/entity/place_hours.dart';
import 'package:i_table/features/place_search/domain/entity/place_search.dart';

import '../../data/model/place_search_model.dart';

class PlaceSearchFactory {
  List<PlaceSearch> getPlaceSearchesFromModel(List<PlaceSearchModel> list) {
    return list
        .map(
          (model) => PlaceSearch(
              placeId: model.placeId,
              placeName: model.placeName,
              placeAddress:
                  '${model.placeAddress.placeStreet}, ${model.placeAddress.placeCity}',
              placeLocation:
                  'google.navigation:q=${model.placeLocation.latitude},${model.placeLocation.longitude}',
              placeDescription: model.placeDescription,
              placeHours: PlaceHours(
                monday: model.placeOpeningHours.monday,
                tuesday: model.placeOpeningHours.tuesday,
                wednesday: model.placeOpeningHours.wednesday,
                thursday: model.placeOpeningHours.thursday,
                friday: model.placeOpeningHours.friday,
                saturday: model.placeOpeningHours.saturday,
                sunday: model.placeOpeningHours.sunday,
              ),
              placeUrl: model.placeUrl,
              imageUrl: model.imageUrl),
        )
        .toList();
  }
}
