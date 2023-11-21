import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/extension/extension.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entity/place_reservation/place_reservation.dart';
import '../../domain/entity/place_reservation/place_reservations_factory.dart';
import '../data_source/place_reservations_remote_data_source.dart';
import '../model/place_reservation/place_reservation_model.dart';

abstract class PlaceReservationsRepository {
  Either<Failure, Stream<List<PlaceReservation>>>
      fetchPlaceReservations(String placeId, DateTime start);
}

class PlaceReservationsRepositoryImpl implements PlaceReservationsRepository {
  final PlaceReservationsRemoteDataSource placeReservationsRemoteDataSource;

  final PlaceReservationsFactory reservationFactory;

  PlaceReservationsRepositoryImpl(
      this.placeReservationsRemoteDataSource, this.reservationFactory);

  @override
  Either<Failure, Stream<List<PlaceReservation>>>
      fetchPlaceReservations(String placeId, DateTime start) {
    try {
      Stream<List<PlaceReservationModel>> placeReservationsModelsStream =
          placeReservationsRemoteDataSource.fetchPlaceReservations(
              placeId, start.onlyDate());

      Stream<List<PlaceReservation>> placeReservationsStream =
          placeReservationsModelsStream
              .map((event) => reservationFactory.getReservations(event));

      return Right(placeReservationsStream);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
