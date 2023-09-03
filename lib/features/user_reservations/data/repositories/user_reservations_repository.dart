import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/features/place_plan/data/models/place_reservation/place_reservation_model.dart';

import '../../../../core/error/failures.dart';
import '../../../place_plan/domain/entities/place_reservation/place_reservation.dart';
import '../../../place_plan/domain/entities/place_reservation/place_reservations_factory.dart';
import '../datasources/user_reservations_remote_data_source.dart';

abstract class UserReservationsRepository {
  Future<Either<Failure, List<PlaceReservation>>> fetchUserReservations(
      String userId);
}

class UserReservationsRepositoryImpl implements UserReservationsRepository {
  final UserReservationsRemoteDataSource remote;
  final PlaceReservationsFactory placeReservationsFactory;

  UserReservationsRepositoryImpl(this.remote, this.placeReservationsFactory);

  @override
  Future<Either<Failure, List<PlaceReservation>>> fetchUserReservations(
      String userId) async {
    try {
      List<PlaceReservationModel> userReservations =
          await remote.fetchUserReservations(userId);

      return Right(placeReservationsFactory.getReservations(userReservations));
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
