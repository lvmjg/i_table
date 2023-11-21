import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';


import '../../../../core/error/failures.dart';
import '../../../../core/util/globals.dart';
import '../../domain/entity/place_details.dart';
import '../../domain/entity/place_details_factory.dart';
import '../data_source/place_details_remote_data_source.dart';
import '../model/place_details_model.dart';

abstract class PlaceDetailsRepository{
  Future<Either<Failure, PlaceDetails>> fetchPlaceDetails(String placeId);
}

class PlaceDetailsRepositoryImpl implements PlaceDetailsRepository{

  final PlaceDetailsRemoteDataSource remote;

  Map<String, PlaceDetailsModel> cachedPlacesDetails = {};

  final PlaceDetailsFactory placeDetailsFactory;

  PlaceDetailsRepositoryImpl(this.remote, this.placeDetailsFactory);

  @override
  Future<Either<Failure, PlaceDetails>> fetchPlaceDetails(String placeId) async{
   PlaceDetailsModel? cachedPlaceDetails = cachedPlacesDetails[placeId];
    if(cachedPlaceDetails != null){
      return Right(placeDetailsFactory.getPlaceDetailsFromModel(cachedPlaceDetails));
    }

    try {
      PlaceDetailsModel placeDetails = await remote
          .fetchPlaceDetails(placeId);

      cachedPlacesDetails[placeId] = placeDetails;

      return Right(placeDetailsFactory.getPlaceDetailsFromModel(placeDetails));
    } on FetchException {
      return Left(FetchFailure());
    }
  }

}