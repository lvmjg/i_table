import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/place_menu.dart';
import '../../domain/entity/place_menu_factory.dart';
import '../datasource/place_menu_remote_data_source.dart';
import '../model/place_menu_model.dart';

abstract class PlaceMenuRepository {
  Future<Either<Failure, PlaceMenu>> fetchPlaceMenu(String placeId);
}

class PlaceMenuRepositoryImpl implements PlaceMenuRepository {
  final PlaceMenuRemoteDataSource remote;
  final PlaceMenuFactory placeMenuFactory;

  PlaceMenuRepositoryImpl(this.remote, this.placeMenuFactory);

  @override
  Future<Either<Failure, PlaceMenu>> fetchPlaceMenu(String placeId) async {
    try {
      PlaceMenuModel? placeMenuModel = await remote.fetchPlaceMenu(placeId);

      if (placeMenuModel != null) {
        return Right(placeMenuFactory.getPlaceMenu(placeMenuModel));
      } else {
        return Left(FetchFailure());
      }
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
