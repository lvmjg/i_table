import 'package:dartz/dartz.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../../../core/error/failures.dart';
import '../entities/search_entity.dart';
import '../repositories/search_repository.dart';

class FetchRestaurants implements UseCase<List<SearchEntity>, NoParams>{
  final SearchRepository searchRepository;

  List<SearchEntity> fetchedRestaurants = [];

  FetchRestaurants(this.searchRepository);

  @override
  Future<Either<Failure, List<SearchEntity>>> call(NoParams params) async{
    Either<Failure, List<SearchEntity>> fetchRestaurantsEither = await searchRepository.fetchRestaurants();

    if(fetchRestaurantsEither.isRight()){
      fetchedRestaurants = fetchRestaurantsEither.getOrElse(() => []);
    }

    return fetchRestaurantsEither;
  }

  List<SearchEntity> filterRestaurants(String input) {

    return fetchedRestaurants.where((element) {
          bool nameContainsInput = element.restaurantName.toLowerCase().contains(input.toLowerCase());
          bool addressContainsInput = element.restaurantAddress.toString().toLowerCase().contains(input.toLowerCase());

          return nameContainsInput || addressContainsInput;
      }).toList();
  }
}