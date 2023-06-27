import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/place_search_entity.dart';
import '../datasources/place_search_remote_data_source.dart';

abstract class PlaceSearchRepository {
  Future<Either<Failure, List<PlaceSearchEntity>>> fetchPlaces();
}

class PlaceSearchRepositoryImpl implements PlaceSearchRepository {
  final PlaceSearchRemoteDataSource remote;

  PlaceSearchRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<PlaceSearchEntity>>> fetchPlaces() async {
    List<PlaceSearchEntity> places = [];
    try {
      places = await remote.fetchPlaces();
      return Right(places);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
