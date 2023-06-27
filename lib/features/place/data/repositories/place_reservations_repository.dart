import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/place_reservation/place_reservation_entity.dart';
import '../datasources/place_reservations_remote_data_source.dart';

abstract class PlaceReservationsRepository {
  Future<Either<Failure, List<PlaceReservationEntity>>> fetchPlaceReservations(
      String placeId, DateTime start, DateTime end);
}

class PlaceReservationsRepositoryImpl
    implements PlaceReservationsRepository {
  final PlaceReservationsRemoteDataSource
      placeReservationsRemoteDataSource;

  PlaceReservationsRepositoryImpl(
      this.placeReservationsRemoteDataSource);

  @override
  Future<Either<Failure, List<PlaceReservationEntity>>> fetchPlaceReservations(
      String placeId, DateTime start, DateTime end) async {
    try {
      List<PlaceReservationEntity> placeReservations =
          await placeReservationsRemoteDataSource
              .fetchPlaceReservations(placeId, start, end);
      return Right(placeReservations);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
