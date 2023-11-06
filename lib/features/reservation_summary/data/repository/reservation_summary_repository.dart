import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';


import '../../../../core/error/failures.dart';
import '../../../../core/util/globals.dart';
import '../../../place_plan/data/model/place_reservation/place_reservation_model.dart';
import '../../../place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../../../place_plan/domain/entity/place_reservation/place_reservations_factory.dart';
import '../data_source/reservation_summary_remote_data_source.dart';

abstract class ReservationSummaryRepository{
  Future<Either<Failure, void>> submitReservation(PlaceReservation placeReservation);
}

class ReservationSummaryRepositoryImpl implements ReservationSummaryRepository{

  final ReservationSummaryRemoteDataSource remote;
  final PlaceReservationsFactory placeReservationsFactory;

  ReservationSummaryRepositoryImpl(this.remote, this.placeReservationsFactory);

  @override
  Future<Either<Failure, void>> submitReservation(PlaceReservation placeReservation) async{
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    try {
      PlaceReservationModel placeReservationModel = placeReservationsFactory.getModelFromPlaceReservation(placeReservation);
      await remote.submitReservation(placeReservationModel);

      return Right(null);
    } on FetchException {
      return Left(FetchFailure());
    }
  }

}