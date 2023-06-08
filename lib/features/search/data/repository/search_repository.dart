import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/search_entity.dart';

class SearchRepository{

  Future<List<SearchEntity>> fetchRestaurants() async{
      FirebaseFirestore ff = FirebaseFirestore.instance;

      await Future.delayed(Duration(seconds: 1));

      QuerySnapshot<Map<String, dynamic>> restaurantsSnapshot = await ff
          .collection('restaurants').get();

      List<SearchEntity> restaurants = restaurantsSnapshot.docs.map((value) => SearchEntity.fromJson(value.id, value.data())).toList();

      return restaurants;
  }
}