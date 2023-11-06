import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../../place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../../data/repository/user_reservations_repository.dart';

class FetchUserReservations
    implements UseCase<List<PlaceReservation>, UserIdParams> {
  final UserReservationsRepository userReservationsRepository;

  FetchUserReservations(this.userReservationsRepository);

  @override
  Future<Either<Failure, List<PlaceReservation>>> call(UserIdParams params) {
    return userReservationsRepository.fetchUserReservations(params.userId);
  }
}
