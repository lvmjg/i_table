import 'package:i_table/core/data_source/firebase_data_source.dart';

import '../../../../core/error/exceptions.dart';
import '../model/place_search_model.dart';

abstract class PlaceSearchRemoteDataSource {
  Future<List<PlaceSearchModel>> fetchPlaces();
}

class PlaceSearchRemoteDataSourceImpl implements PlaceSearchRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Future<List<PlaceSearchModel>> fetchPlaces() async {
    try {
      return await fds.fetchPlaces();
    } catch (e, s) {
      throw FetchException();
    }
  }
}
