import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../model/place_settings/place_settings_model.dart';

abstract class PlaceSettingsRemoteDataSource {
  Future<PlaceSettingsModel?> fetchPlaceSettings(
      String placeId);
}

class PlaceSettingsRemoteDataSourceImpl
    implements PlaceSettingsRemoteDataSource {
  @override
  Future<PlaceSettingsModel?> fetchPlaceSettings(
      String placeId) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    try {
      FirebaseFirestore ff = FirebaseFirestore.instance;

      QuerySnapshot<Map<String, dynamic>> placeSettingsSnapshot =
          await ff
              .collection(pathPlacesSettings)
              .where(pathPlaceId, isEqualTo: placeId)
              .get(const GetOptions(source: Source.server));

      PlaceSettingsModel? placeSettings = null;
      if (placeSettingsSnapshot.docs.isNotEmpty) {
        QueryDocumentSnapshot<Map<String, dynamic>> firstDocument =
            placeSettingsSnapshot.docs.first;

        placeSettings = PlaceSettingsModel.fromJson(
            firstDocument.id, firstDocument.data());
      }

      return placeSettings;
    } catch (e, s) {
      throw FetchException();
    }
  }
}
