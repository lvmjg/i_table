import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/place_reservation/place_reservation.dart';
import '../../domain/entities/place_reservation/place_reservations_factory.dart';
import '../datasources/place_reservations_remote_data_source.dart';
import '../models/place_reservation/place_reservation_model.dart';

abstract class PlaceReservationsRepository {
  Future<Either<Failure, Stream<List<PlaceReservation>>>> fetchPlaceReservations(
      String placeId, DateTime start);
}

class PlaceReservationsRepositoryImpl
    implements PlaceReservationsRepository {
  final PlaceReservationsRemoteDataSource
      placeReservationsRemoteDataSource;

  final PlaceReservationsFactory reservationFactory;

  PlaceReservationsRepositoryImpl(
      this.placeReservationsRemoteDataSource, this.reservationFactory);

  @override
  Future<Either<Failure, Stream<List<PlaceReservation>>>> fetchPlaceReservations(
      String placeId, DateTime start) async {
    try {
      Stream<List<PlaceReservationModel>> placeReservationsModelStream =
          placeReservationsRemoteDataSource
              .fetchPlaceReservations(placeId, DateTime(2023,07,16));
      
      Stream<List<PlaceReservation>> placeReservationsStream = placeReservationsModelStream.map((placeReservationsModel) => reservationFactory.getReservations(placeReservationsModel));

      return Right(placeReservationsStream);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
