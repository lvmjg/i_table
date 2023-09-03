import 'package:dartz/dartz.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/place_search_model.dart';
import '../../data/repositories/place_search_repository.dart';
import '../entities/place_search.dart';

class FetchPlaces implements UseCase<List<PlaceSearch>, NoParams> {
  final PlaceSearchRepository searchRepository;

  List<PlaceSearch> places = [];

  FetchPlaces(this.searchRepository);

  @override
  Future<Either<Failure, List<PlaceSearch>>> call(NoParams params) async {
    Either<Failure, List<PlaceSearch>> placesEither =
        await searchRepository.fetchPlaces();

    if (placesEither.isRight()) {
      places = placesEither.getOrElse(() => []);
    }

    return placesEither;
  }

  List<PlaceSearch> filterPlaces(String input) {
    return places.where((element) {
      bool nameContainsInput =
          element.placeName.toLowerCase().contains(input.toLowerCase());
      bool addressContainsInput = element.placeAddress
          .toString()
          .toLowerCase()
          .contains(input.toLowerCase());

      return nameContainsInput || addressContainsInput;
    }).toList();
  }
}
