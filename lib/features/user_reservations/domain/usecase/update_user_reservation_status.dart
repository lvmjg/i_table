import 'package:dartz/dartz.dart';
import 'package:i_table/core/util/globals.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repository/user_reservations_repository.dart';

class UpdateUserReservationStatus
    implements UseCase<void, ReservationUpdateStatusParams> {
  final UserReservationsRepository userReservationsRepository;

  UpdateUserReservationStatus(this.userReservationsRepository);

  @override
  Future<Either<Failure, void>> call(ReservationUpdateStatusParams params) async {
    String newStatus;
    if(DateTime.now().isBefore(params.startDate)){
      newStatus = 'cancelled';
    }
    else{
      newStatus = 'closed';
    }

    return await userReservationsRepository.updateStatus(params.copyWith(closeStatus: newStatus));
  }

}