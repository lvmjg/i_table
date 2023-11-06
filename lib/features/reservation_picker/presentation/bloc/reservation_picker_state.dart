part of 'reservation_picker_bloc.dart';

@immutable
abstract class ReservationPickerState {}

class ReservationPickerInitial extends ReservationPickerState{}

class ReservationPickerChange extends ReservationPickerState {
  final ReservationPickerData data;

  ReservationPickerChange({required this.data});
}
