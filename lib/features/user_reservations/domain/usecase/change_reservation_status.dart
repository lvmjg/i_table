import 'package:dartz/dartz.dart';
import 'package:i_table/core/util/globals.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repository/user_reservations_repository.dart';

class ChangeReservationStatus
    implements UseCase<void, ReservationChangeStatusParams> {
  final UserReservationsRepository userReservationsRepository;

  ChangeReservationStatus(this.userReservationsRepository);

  @override
  Future<Either<Failure, void>> call(ReservationChangeStatusParams params) async {
    String newStatus;
    if(DateTime.now().isBefore(params.startDate)){
      newStatus = 'cancelled';
    }
    else{
      newStatus = 'closed';
    }

    return await userReservationsRepository.changeStatus(params.copyWith(closeStatus: newStatus));
  }

}