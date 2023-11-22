part of 'place_bloc.dart';

@immutable
abstract class PlaceEvent {}

class PlaceInitiated extends PlaceEvent {
  final String placeId;
  final DateTime reservationDateTime;
  final Duration reservationDuration;

  PlaceInitiated(
      {required this.placeId,
      required this.reservationDateTime,
      required this.reservationDuration});
}

class PlaceDisposed extends PlaceEvent {}

class PlacePlanElementTapped extends PlaceEvent {
  final String planElementId;

  PlacePlanElementTapped({required this.planElementId});
}

class PlaceReservationPickerChanged extends PlaceEvent {
  final DateTime reservationDateTime;
  final Duration reservationDuration;

  PlaceReservationPickerChanged(
      {required this.reservationDateTime, required this.reservationDuration});
}

class PlaceReservationElementsRemoved extends PlaceEvent {}

class PlaceReservationElementsAdded extends PlaceEvent {}
