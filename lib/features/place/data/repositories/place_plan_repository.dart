import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/error/failures.dart';

import '../../domain/entities/place_plan/place_plan_level_entity.dart';
import '../datasources/place_plan_remote_data_source.dart';

abstract class PlacePlanRepository {
  Future<Either<Failure, List<PlacePlanLevelEntity>>> fetchPlacePlan(
      String placeId);
}

class PlacePlanRepositoryImpl implements PlacePlanRepository {
  final PlacePlanRemoteDataSource placePlanRemoteDataSource;

  PlacePlanRepositoryImpl(this.placePlanRemoteDataSource);

  @override
  Future<Either<Failure, List<PlacePlanLevelEntity>>> fetchPlacePlan(
      String placeId) async {
    try {
      List<PlacePlanLevelEntity> placePlanLevels =
          await placePlanRemoteDataSource
              .fetchPlacePlan(placeId);
      return Right(placePlanLevels);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
