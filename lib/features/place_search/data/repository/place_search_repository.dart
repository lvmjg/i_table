import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/error/failures.dart';

import '../../domain/entity/place_search.dart';
import '../../domain/entity/place_search_factory.dart';
import '../data_source/place_search_remote_data_source.dart';
import '../model/place_search_model.dart';

abstract class PlaceSearchRepository {
  Future<Either<Failure, List<PlaceSearch>>> fetchPlaces();
}

class PlaceSearchRepositoryImpl implements PlaceSearchRepository {
  final PlaceSearchRemoteDataSource remote;

  final PlaceSearchFactory placeSearchFactory;

  PlaceSearchRepositoryImpl(this.remote, this.placeSearchFactory);

  @override
  Future<Either<Failure, List<PlaceSearch>>> fetchPlaces() async {
    try {
      List<PlaceSearchModel> places = await remote.fetchPlaces();
      return Right(placeSearchFactory.getPlaceSearchesFromModel(places));
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
