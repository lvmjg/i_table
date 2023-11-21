import 'package:i_table/core/data_source/firebase_data_source.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../model/place_plan/place_plan_level_model.dart';

abstract class PlacePlanRemoteDataSource {
  Future<List<PlacePlanLevelModel>> fetchPlacePlan(String placeId);
}

class PlacePlanRemoteDataSourceImpl implements PlacePlanRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Future<List<PlacePlanLevelModel>> fetchPlacePlan(String placeId) async {
    try {
      return await fds.fetchPlacePlan(placeId);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
