import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/extension/extension.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entity/place_reservation/place_reservation.dart';
import '../../domain/entity/place_reservation/place_reservations_factory.dart';
import '../data_source/place_reservations_remote_data_source.dart';
import '../model/place_reservation/place_reservation_model.dart';

abstract class PlaceReservationsRepository {
  Future<Either<Failure, List<PlaceReservation>>> fetchPlaceReservations(
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
  Future<Either<Failure, List<PlaceReservation>>> fetchPlaceReservations(
      String placeId, DateTime start) async {
    try {
      List<PlaceReservationModel> placeReservationsModel =
         await placeReservationsRemoteDataSource
              .fetchPlaceReservations(placeId, start.onlyDate());
      
      List<PlaceReservation> placeReservations = reservationFactory.getReservations(placeReservationsModel);

      return Right(placeReservations);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
