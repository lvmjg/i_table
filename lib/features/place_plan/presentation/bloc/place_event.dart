part of 'place_bloc.dart';

@immutable
abstract class PlaceEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class PlaceInitiated extends PlaceEvent{
  final String placeId;
  final DateTime reservationDateTime;
  final Duration reservationDuration;

  PlaceInitiated({required this.placeId, required this.reservationDateTime, required this.reservationDuration});

  @override
  List<Object> get props => [placeId, reservationDateTime, reservationDuration];
}

class PlaceDisposed extends PlaceEvent{}

class PlacePlanElementTapped extends PlaceEvent{

  final String planElementId;

  PlacePlanElementTapped({required this.planElementId});

  @override
  List<Object> get props => [planElementId];
}

class PlaceReservationPickerChanged extends PlaceEvent{
  final DateTime reservationDateTime;
  final Duration reservationDuration;

  PlaceReservationPickerChanged({required this.reservationDateTime, required this.reservationDuration});

  @override
  List<Object> get props => [reservationDateTime];
}



class PlaceReservationElementsRemoved extends PlaceEvent{}

class PlaceReservationElementsAdded extends PlaceEvent{}