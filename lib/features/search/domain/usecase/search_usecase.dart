import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/features/search/data/repository/search_repository.dart';
import '../entity/search_entity.dart';

class SearchUseCase{

  List<SearchEntity> fetchedRestaurants = [];

  Future<List<SearchEntity>> fetchRestaurants() async{
    SearchRepository searchRepository = SearchRepository();

    fetchedRestaurants = await searchRepository.fetchRestaurants();

    return fetchedRestaurants;
  }

  List<SearchEntity> filterRestaurants(String input) {

    return fetchedRestaurants.where((element) {
          bool nameContainsInput = element.restaurantName.toLowerCase().contains(input.toLowerCase());
          bool addressContainsInput = element.restaurantAddress.toString().toLowerCase().contains(input.toLowerCase());

          return nameContainsInput || addressContainsInput;
      }).toList();
  }
}