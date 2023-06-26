import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/features/restaurant_details/data/datasources/restaurant_details_remote_data_source.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_details_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/globals.dart';

abstract class RestaurantDetailsRepository{
  Future<Either<Failure, RestaurantDetailsEntity>> fetchRestaurantDetails(String restaurantId);
}

class RestaurantDetailsRepositoryImpl implements RestaurantDetailsRepository{

  final RestaurantDetailsRemoteDataSource remote;

  Map<String, RestaurantDetailsEntity> cachedRestaurantsDetails = {};

  RestaurantDetailsRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, RestaurantDetailsEntity>> fetchRestaurantDetails(String restaurantId) async{

    Future.delayed(Duration(seconds: TEST_TIMEOUT));

    RestaurantDetailsEntity? cachedRestaurantDetails = cachedRestaurantsDetails[restaurantId];
    if(cachedRestaurantDetails != null){
      return Right(cachedRestaurantDetails);
    }

    try {
      RestaurantDetailsEntity restaurantDetails = await remote
          .fetchRestaurantDetails(restaurantId);

      cachedRestaurantsDetails[restaurantId] = restaurantDetails;

      return Right(restaurantDetails);
    } on FetchException {
      return Left(FetchFailure());
    }
  }

}