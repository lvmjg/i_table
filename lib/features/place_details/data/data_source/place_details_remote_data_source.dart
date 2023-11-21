import 'package:i_table/core/data_source/firebase_data_source.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../model/place_details_model.dart';

abstract class PlaceDetailsRemoteDataSource {
  Future<PlaceDetailsModel> fetchPlaceDetails(String placeId);
}

class PlaceDetailsRemoteDataSourceImpl implements PlaceDetailsRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Future<PlaceDetailsModel> fetchPlaceDetails(String placeId) async {
    try {
      return await fds.fetchPlaceDetails(placeId);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
