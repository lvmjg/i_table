import 'package:i_table/features/place_entry/domain/entities/time_restricted_reservation.dart';
import 'package:i_table/features/place_entry/domain/entities/time_unlimited_reservation.dart';

class ReservationLogic {
  final int reservationMode;
  final int maxNumberOfReservationsPerUser;
  final int maxNumberOfSittingsPerUser;
  final int reservationInterval;
  final int reservationDaysAhead;
  final TimeRestrictedReservation timeRestrictedReservation;
  final TimeUnlimitedReservation timeUnlimitedReservation;

  ReservationLogic({
    required this.reservationMode,
    required this.maxNumberOfReservationsPerUser,
    required this.maxNumberOfSittingsPerUser,
    required this.reservationInterval,
    required this.reservationDaysAhead,
    required this.timeRestrictedReservation,
    required this.timeUnlimitedReservation,
  });
}
