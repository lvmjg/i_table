class TimeRestrictedReservation{
  final int maxReservationDuration;
  final int minReservationDuration;
  final int reservationDefaultDuration;
  final int reservationDurationInterval;

  TimeRestrictedReservation({required this.maxReservationDuration, required this.minReservationDuration, required this.reservationDefaultDuration, required this.reservationDurationInterval});
}