import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../../place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../../../place_plan/domain/entity/place_reservation/place_reservations_factory.dart';
import '../../data/data_source/reservation_summary_remote_data_source.dart';
import '../../data/repository/reservation_summary_repository.dart';
import '../../domain/usecase/submit_reservation.dart';

part 'reservation_summary_event.dart';

part 'reservation_summary_state.dart';

class ReservationSummaryBloc
    extends Bloc<ReservationSummaryEvent, ReservationSummaryState> {
  late PlaceReservation requestedReservation;

  ReservationSummaryBloc() : super(ReservationSummarySubmitInProgress()) {
    SubmitReservation submitReservation = SubmitReservation(
        ReservationSummaryRepositoryImpl(
            ReservationSummaryRemoteDataSourceImpl(),
            PlaceReservationsFactory()));

    on<ReservationSummaryInitiated>((event, emit) {
      requestedReservation = event.reservation;
      emit(ReservationSummaryInitial(reservation: event.reservation));
    });

    on<ReservationSummaryCancelled>((event, emit) {
      emit(ReservationSummaryCancel());
    });

    on<ReservationSummarySubmitted>((event, emit) async {
      emit(ReservationSummarySubmitInProgress());

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      if (state is ReservationSummarySubmitInProgress) {
        (await submitReservation(
                ReservationSummaryParams(reservation: requestedReservation)))
            .fold(
                (failure) => emit(ReservationSummarySubmitFailure(
                    params: ErrorParams(errorMessage: errorFetchData))),
                (nothing) => emit(ReservationSummarySubmitSuccess()));
      }
    });
  }
}
