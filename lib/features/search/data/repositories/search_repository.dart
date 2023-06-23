import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/util/globals.dart';
import '../../domain/entities/search_entity.dart';

class SearchRepository{

  Future<List<SearchEntity>> fetchRestaurants() async{
      FirebaseFirestore ff = FirebaseFirestore.instance;

      await Future.delayed(Duration(seconds: TEST_TIMEOUT));

      QuerySnapshot<Map<String, dynamic>> restaurantsSnapshot = await ff
          .collection(RESTAURANTS).get();

      List<SearchEntity> restaurants = restaurantsSnapshot.docs.map((value) => SearchEntity.fromJson(value.id, value.data())).toList();

      return restaurants;
  }
}