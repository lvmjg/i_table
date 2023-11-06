import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entity/place_settings.dart';
import '../../domain/entity/place_settings_factory.dart';
import '../data_source/place_settings_remote_data_source.dart';
import '../model/place_settings/place_settings_model.dart';

abstract class PlaceSettingsRepository {
  Future<Either<Failure, PlaceSettings>>
      fetchPlaceSettings(String placeId);
}

class PlaceSettingsRepositoryImpl
    implements PlaceSettingsRepository {
  final PlaceSettingsRemoteDataSource
      placeSettingsRemoteDataSource;

  final PlaceSettingsFactory placeSettingsFactory;

  PlaceSettingsRepositoryImpl(
      this.placeSettingsRemoteDataSource, this.placeSettingsFactory);

  @override
  Future<Either<Failure, PlaceSettings>>
      fetchPlaceSettings(String placeId) async {
    try {
      PlaceSettingsModel? placeSettingsModel =
          await placeSettingsRemoteDataSource
              .fetchPlaceSettings(placeId);

      if (placeSettingsModel != null) {
        return Right(placeSettingsFactory.getPlaceSettingsFromModel(placeSettingsModel));
      } else {
        return Left(FetchFailure());
      }
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
