import 'package:i_table/core/data_source/firebase_data_source.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../model/place_settings/place_settings_model.dart';

abstract class PlaceSettingsRemoteDataSource {
  Future<PlaceSettingsModel?> fetchPlaceSettings(String placeId);
}

class PlaceSettingsRemoteDataSourceImpl
    implements PlaceSettingsRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Future<PlaceSettingsModel?> fetchPlaceSettings(String placeId) async {
    try {
      return await fds.fetchPlaceSettings(placeId);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
