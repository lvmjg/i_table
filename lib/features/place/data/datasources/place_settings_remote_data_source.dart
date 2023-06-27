import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../../domain/entities/place_settings/place_settings_entity.dart';

abstract class PlaceSettingsRemoteDataSource {
  Future<PlaceSettingsEntity?> fetchPlaceSettings(
      String placeId);
}

class PlaceSettingsRemoteDataSourceImpl
    implements PlaceSettingsRemoteDataSource {
  @override
  Future<PlaceSettingsEntity?> fetchPlaceSettings(
      String placeId) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    try {
      FirebaseFirestore ff = FirebaseFirestore.instance;

      QuerySnapshot<Map<String, dynamic>> placeSettingsSnapshot =
          await ff
              .collection(pathPlacesSettings)
              .where(pathPlaceId, isEqualTo: placeId)
              .get();

      PlaceSettingsEntity? placeSettings = null;
      if (placeSettingsSnapshot.docs.isNotEmpty) {
        QueryDocumentSnapshot<Map<String, dynamic>> firstDocument =
            placeSettingsSnapshot.docs.first;

        placeSettings = PlaceSettingsEntity.fromJson(
            firstDocument.id, firstDocument.data());
      }

      return placeSettings;
    } catch (e, s) {
      throw FetchException();
    }
  }
}
