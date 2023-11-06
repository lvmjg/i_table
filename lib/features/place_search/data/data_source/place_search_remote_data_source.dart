import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/util/globals.dart';
import '../model/place_search_model.dart';

abstract class PlaceSearchRemoteDataSource{
  Future<List<PlaceSearchModel>> fetchPlaces();
}

class PlaceSearchRemoteDataSourceImpl implements PlaceSearchRemoteDataSource{
  @override
  Future<List<PlaceSearchModel>> fetchPlaces() async {
    FirebaseFirestore ff = FirebaseFirestore.instance;

    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    List<PlaceSearchModel> places = [];
    try {
      QuerySnapshot<Map<String, dynamic>> placesSnapshot = await ff
           .collection(pathPlaces).get();

      places = placesSnapshot.docs.map((value) => PlaceSearchModel.fromJson(value.id, value.data())).toList();
    } catch(e, s){
      throw FetchException();
    }

    return places;
  }

}
