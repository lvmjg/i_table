import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/features/place_plan/presentation/widgets/place_page/body/place_plan.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/util/globals.dart';
import '../model/place_menu_model.dart';

abstract class PlaceMenuRemoteDataSource {
  Future<PlaceMenuModel?> fetchPlaceMenu(String placeId);
}

class PlaceMenuRemoteDataSourceImpl implements PlaceMenuRemoteDataSource {
  @override
  Future<PlaceMenuModel?> fetchPlaceMenu(String placeId) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    FirebaseFirestore ff = FirebaseFirestore.instance;

    PlaceMenuModel? placeMenuModel;
    try {
      QuerySnapshot<Map<String, dynamic>> placeMenuSnapshot =
          await ff.collection('$pathPlaces/$placeId/$pathPlaceMenu').get();

      List<PlaceMenuModel> placeMenuModels = placeMenuSnapshot.docs
          .map((value) => PlaceMenuModel.fromJson(value.data()))
          .toList();

      if (placeMenuModels.isNotEmpty) {
        placeMenuModel = placeMenuModels.first;
      }
    } catch (e, s) {
      throw FetchException();
    }

    return placeMenuModel;
  }
}
