import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/search_entity.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_remote_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remote;

  SearchRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<SearchEntity>>> fetchRestaurants() async {
    List<SearchEntity> restaurants = [];
    try {
      restaurants = await remote.fetchRestaurants();
      return Right(restaurants);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
