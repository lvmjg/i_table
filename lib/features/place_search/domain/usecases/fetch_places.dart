import 'package:dartz/dartz.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../../../core/error/failures.dart';
import '../../data/repositories/place_search_repository.dart';
import '../entities/place_search_entity.dart';

class FetchPlaces implements UseCase<List<PlaceSearchEntity>, NoParams> {
  final PlaceSearchRepository searchRepository;

  List<PlaceSearchEntity> places = [];

  FetchPlaces(this.searchRepository);

  @override
  Future<Either<Failure, List<PlaceSearchEntity>>> call(NoParams params) async {
    Either<Failure, List<PlaceSearchEntity>> placesEither =
        await searchRepository.fetchPlaces();

    if (placesEither.isRight()) {
      places = placesEither.getOrElse(() => []);
    }

    return placesEither;
  }

  List<PlaceSearchEntity> filterPlaces(String input) {
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
