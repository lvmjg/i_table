import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/util/globals.dart';
import '../../domain/entities/place_search_entity.dart';

abstract class PlaceSearchRemoteDataSource{
  Future<List<PlaceSearchEntity>> fetchPlaces();
}

class PlaceSearchRemoteDataSourceImpl implements PlaceSearchRemoteDataSource{
  @override
  Future<List<PlaceSearchEntity>> fetchPlaces() async {
    FirebaseFirestore ff = FirebaseFirestore.instance;

    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    List<PlaceSearchEntity> places = [];
    try {
      QuerySnapshot<Map<String, dynamic>> placesSnapshot = await ff
           .collection(pathPlaces).get();

      places = placesSnapshot.docs.map((value) => PlaceSearchEntity.fromJson(value.id, value.data())).toList();
    } catch(e, s){
      throw FetchException();
    }

    return places;
  }

}
