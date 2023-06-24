import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/features/search/domain/entities/search_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/util/globals.dart';

abstract class SearchRemoteDataSource{
  Future<List<SearchEntity>> fetchRestaurants();
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource{
  @override
  Future<List<SearchEntity>> fetchRestaurants() async {
    FirebaseFirestore ff = FirebaseFirestore.instance;

    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    List<SearchEntity> restaurants = [];
    try {
      QuerySnapshot<Map<String, dynamic>> restaurantsSnapshot = await ff
           .collection(RESTAURANTS).get();

      restaurants = restaurantsSnapshot.docs.map((value) => SearchEntity.fromJson(value.id, value.data())).toList();
    } catch(e, s){
      throw FetchException();
    }

    return restaurants;
  }

}
