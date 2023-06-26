
import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/features/restaurant_plan/data/datasources/restaurant_reservations_remote_data_source.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/reservation/reservation_entity.dart';
import '../../domain/repositories/restaurant_reservations_repository.dart';

class RestaurantReservationsRepositoryImpl implements RestaurantReservationsRepository {
  final RestaurantReservationsRemoteDataSource restaurantReservationsRemoteDataSource;

  RestaurantReservationsRepositoryImpl(this.restaurantReservationsRemoteDataSource);

  @override
  Future<Either<Failure, List<ReservationEntity>>> fetchRestaurantReservations(
      String restaurantId, DateTime start, DateTime end) async {
    try {
      List<ReservationEntity> restaurantReservations =
          await restaurantReservationsRemoteDataSource
          .fetchRestaurantReservations(restaurantId, start, end);
      return Right(restaurantReservations);
    } on FetchException {
      return Left(FetchFailure());
    }
  }


}