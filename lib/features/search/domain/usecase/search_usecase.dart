import 'package:cloud_firestore/cloud_firestore.dart';
import '../entity/search_entity.dart';

class SearchUseCase{

  List<SearchEntity> fetchedRestaurants = [];

  Future<List<SearchEntity>> fetchRestaurants() async{

    if(fetchedRestaurants.isEmpty) {
      FirebaseFirestore ff = FirebaseFirestore.instance;

      await Future.delayed(Duration(seconds: 3));
      QuerySnapshot<Map<String, dynamic>> restaurantsSnapshot = await ff
          .collection('restaurants').get();

      fetchedRestaurants = restaurantsSnapshot.docs.map((value) =>
          SearchEntity(
              restaurantId: value.id,
              restaurantName: value['restaurantName'],
              restaurantAddress: value['restaurantName'])).toList();
    }

    return fetchedRestaurants;
  }

  List<SearchEntity> filterRestaurants(String input) {

    return fetchedRestaurants.where((element) {
          bool nameContainsInput = element.restaurantName.toLowerCase().contains(input.toLowerCase());
          bool addressContainsInput = element.restaurantAddress.toLowerCase().contains(input.toLowerCase());

          return nameContainsInput || addressContainsInput;
      }).toList();
  }
}