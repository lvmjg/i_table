class TimeUnlimitedReservation{
  final bool canReserveBeforeAnotherReservation;
  final int reserveBeforeAnotherReservationInterval;

  TimeUnlimitedReservation({required this.canReserveBeforeAnotherReservation, required this.reserveBeforeAnotherReservationInterval});
}