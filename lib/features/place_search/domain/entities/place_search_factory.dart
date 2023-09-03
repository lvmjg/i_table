import 'package:i_table/features/place_search/domain/entities/place_search.dart';

import '../../data/models/place_search_model.dart';

class PlaceSearchFactory {
  List<PlaceSearch> getPlaceSearchesFromModel(List<PlaceSearchModel> list) {
    return list
        .map((model) => PlaceSearch(model.placeId, model.placeName,
            '${model.placeAddress.placeStreet}, ${model.placeAddress.placeCity}'))
        .toList();
  }
}
