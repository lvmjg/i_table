import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../model/place_details_model.dart';

abstract class PlaceDetailsRemoteDataSource{
  Future<PlaceDetailsModel> fetchPlaceDetails(String placeId);
}

class PlaceDetailsRemoteDataSourceImpl implements PlaceDetailsRemoteDataSource{

  @override
  Future<PlaceDetailsModel> fetchPlaceDetails(String placeId) async{
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    FirebaseFirestore ff = FirebaseFirestore.instance;

    PlaceDetailsModel placeDetails;
    try {
      QuerySnapshot<Map<String, dynamic>> placesDetailsSnapshot = await ff
          .collection(pathPlacesDetails).where(
          pathPlaceId, isEqualTo: placeId).get();

      placeDetails = placesDetailsSnapshot
          .docs.map((value) =>
          PlaceDetailsModel.fromJson(value.data()))
          .toList()
          .first;
    } catch(e, s){
      throw FetchException();
    }

    return placeDetails;
  }


}