
import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';


import '../../../../core/error/failures.dart';
import '../../../../core/util/globals.dart';
import '../../domain/entity/place_details_entity.dart';
import '../datasources/place_details_remote_data_source.dart';

abstract class PlaceDetailsRepository{
  Future<Either<Failure, PlaceDetailsEntity>> fetchPlaceDetails(String placeId);
}

class PlaceDetailsRepositoryImpl implements PlaceDetailsRepository{

  final PlaceDetailsRemoteDataSource remote;

  Map<String, PlaceDetailsEntity> cachedPlacesDetails = {};

  PlaceDetailsRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, PlaceDetailsEntity>> fetchPlaceDetails(String placeId) async{

    Future.delayed(Duration(seconds: TEST_TIMEOUT));

    PlaceDetailsEntity? cachedPlaceDetails = cachedPlacesDetails[placeId];
    if(cachedPlaceDetails != null){
      return Right(cachedPlaceDetails);
    }

    try {
      PlaceDetailsEntity placeDetails = await remote
          .fetchPlaceDetails(placeId);

      cachedPlacesDetails[placeId] = placeDetails;

      return Right(placeDetails);
    } on FetchException {
      return Left(FetchFailure());
    }
  }

}