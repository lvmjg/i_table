import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/place_settings/place_settings_entity.dart';
import '../datasources/place_settings_remote_data_source.dart';

abstract class PlaceSettingsRepository {
  Future<Either<Failure, PlaceSettingsEntity>>
      fetchPlaceSettings(String placeId);
}

class PlaceSettingsRepositoryImpl
    implements PlaceSettingsRepository {
  final PlaceSettingsRemoteDataSource
      placeSettingsRemoteDataSource;

  PlaceSettingsRepositoryImpl(
      this.placeSettingsRemoteDataSource);

  @override
  Future<Either<Failure, PlaceSettingsEntity>>
      fetchPlaceSettings(String placeId) async {
    try {
      PlaceSettingsEntity? placePlanLevels =
          await placeSettingsRemoteDataSource
              .fetchPlaceSettings(placeId);
      if (placePlanLevels != null) {
        return Right(placePlanLevels);
      } else {
        return Left(FetchFailure());
      }
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
