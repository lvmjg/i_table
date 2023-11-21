part of 'reservation_picker_bloc.dart';

@immutable
abstract class ReservationPickerEvent {}

class ReservationPickerInitiated extends ReservationPickerEvent {
  final ReservationPickerData data;

  ReservationPickerInitiated({required this.data});
}

class ReservationPickerDateIncreased extends ReservationPickerEvent {}

class ReservationPickerDateDecreased extends ReservationPickerEvent {}

class ReservationPickerDateSet extends ReservationPickerEvent {
  final DateTime reservationDate;

  ReservationPickerDateSet({required this.reservationDate});
}

class ReservationPickerTimeIncreased extends ReservationPickerEvent {}

class ReservationPickerTimeDecreased extends ReservationPickerEvent {}

class ReservationPickerTimeSet extends ReservationPickerEvent {
  final TimeOfDay reservationTime;

  ReservationPickerTimeSet({required this.reservationTime});
}

class ReservationPickerDurationSet extends ReservationPickerEvent {
  final Duration reservationDuration;

  ReservationPickerDurationSet({required this.reservationDuration});
}
