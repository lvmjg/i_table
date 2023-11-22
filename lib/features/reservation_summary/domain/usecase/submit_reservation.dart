import 'package:dartz/dartz.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../../../core/error/failures.dart';
import '../../data/repository/reservation_summary_repository.dart';

class SubmitReservation implements UseCase<void, ReservationSummaryParams> {
  final ReservationSummaryRepository reservationSummaryRepository;

  SubmitReservation(this.reservationSummaryRepository);

  @override
  Future<Either<Failure, void>> call(ReservationSummaryParams params) async {
    return await reservationSummaryRepository
        .submitReservation(params.reservation);
  }
}
