import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/util/globals.dart';
import '../../domain/entity/place_details_entity.dart';

abstract class PlaceDetailsRemoteDataSource{
  Future<PlaceDetailsEntity> fetchPlaceDetails(String placeId);
}

class PlaceDetailsRemoteDataSourceImpl implements PlaceDetailsRemoteDataSource{

  @override
  Future<PlaceDetailsEntity> fetchPlaceDetails(String placeId) async{
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    FirebaseFirestore ff = FirebaseFirestore.instance;

    PlaceDetailsEntity placeDetails;
    try {
      QuerySnapshot<Map<String, dynamic>> placesDetailsSnapshot = await ff
          .collection(pathPlacesDetails).where(
          pathPlaceId, isEqualTo: placeId).get();

      placeDetails = placesDetailsSnapshot
          .docs.map((value) =>
          PlaceDetailsEntity.fromJson(value.data()))
          .toList()
          .first;
    } catch(e, s){
      throw FetchException();
    }

    return placeDetails;
  }


}