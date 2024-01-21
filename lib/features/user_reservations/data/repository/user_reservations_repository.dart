import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../place_plan/data/model/place_reservation/place_reservation_model.dart';
import '../../../place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../../../place_plan/domain/entity/place_reservation/place_reservations_factory.dart';
import '../data_source/user_reservations_remote_data_source.dart';

abstract class UserReservationsRepository {
  List<PlaceReservation> reservations = [];
  Either<Failure, Stream<List<PlaceReservation>>> fetchUserReservations(
      UserIdParams params);
  Future<Either<Failure, void>> changeStatus(ReservationChangeStatusParams params);
}

class UserReservationsRepositoryImpl implements UserReservationsRepository {
  final UserReservationsRemoteDataSource remote;
  final PlaceReservationsFactory placeReservationsFactory;

  @override
  List<PlaceReservation> reservations = [];

  UserReservationsRepositoryImpl(this.remote, this.placeReservationsFactory);

  @override
  Either<Failure, Stream<List<PlaceReservation>>> fetchUserReservations(
      UserIdParams params) {
    try {
      Stream<List<PlaceReservationModel>> userReservationsModelsStream =
          remote.fetchUserReservations(params);

      Stream<List<PlaceReservation>> userReservationsStream =
          userReservationsModelsStream
              .map((event) {
                reservations = placeReservationsFactory.getReservations(event);
           return reservations;
          });

      return Right(userReservationsStream);
    } on FetchException {
      return Left(FetchFailure());
    }
  }

  @override
  Future<Either<Failure, void>> changeStatus(ReservationChangeStatusParams params) async {
    try {
      await remote.updateReservationStatus(params);
      return Right(null);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
