import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/error/failures.dart';
import '../../../place_plan/data/model/place_reservation/place_reservation_model.dart';
import '../../../place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../../../place_plan/domain/entity/place_reservation/place_reservations_factory.dart';
import '../data_source/user_reservations_remote_data_source.dart';

abstract class UserReservationsRepository {
  Either<Failure, Stream<List<PlaceReservation>>> fetchUserReservations(
      String userId);
}

class UserReservationsRepositoryImpl implements UserReservationsRepository {
  final UserReservationsRemoteDataSource remote;
  final PlaceReservationsFactory placeReservationsFactory;

  UserReservationsRepositoryImpl(this.remote, this.placeReservationsFactory);

  @override
  Either<Failure, Stream<List<PlaceReservation>>> fetchUserReservations(
      String userId) {
    try {
      Stream<List<PlaceReservationModel>> userReservationsModelsStream =
          remote.fetchUserReservations(userId);

      Stream<List<PlaceReservation>> userReservationsStream =
          userReservationsModelsStream
              .map((event) => placeReservationsFactory.getReservations(event));

      return Right(userReservationsStream);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
