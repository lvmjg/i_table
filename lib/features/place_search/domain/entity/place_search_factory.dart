import 'package:i_table/features/place_search/domain/entity/place_search.dart';

import '../../data/model/place_search_model.dart';

class PlaceSearchFactory {
  List<PlaceSearch> getPlaceSearchesFromModel(List<PlaceSearchModel> list) {
    return list
        .map((model) => PlaceSearch(model.placeId, model.placeName,
            '${model.placeAddress.placeStreet}, ${model.placeAddress.placeCity}'))
        .toList();
  }
}
