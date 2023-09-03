part of 'place_bloc.dart';

@immutable
abstract class PlaceEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class PlaceInitiated extends PlaceEvent{
  final String placeId;
  final DateTime reservationTime;

  PlaceInitiated({required this.placeId, required this.reservationTime});

  @override
  List<Object> get props => [reservationTime];
}

class PlaceDisposed extends PlaceEvent{}

class PlacePlanElementTapped extends PlaceEvent{

  final String planElementId;

  PlacePlanElementTapped({required this.planElementId});

  @override
  List<Object> get props => [planElementId];
}

class PlaceReservationDateChanged extends PlaceEvent{

  final DateTime reservationDate;

  PlaceReservationDateChanged({required this.reservationDate});

  @override
  List<Object> get props => [reservationDate];
}

class PlaceReservationTimeChanged extends PlaceEvent{

  final TimeOfDay reservationTime;

  PlaceReservationTimeChanged({required this.reservationTime});

  @override
  List<Object> get props => [reservationTime];
}

class PlaceReservationElementsRemoved extends PlaceEvent{}

class PlaceReservationElementsAdded extends PlaceEvent{}

class PlaceReservationRequest extends PlaceEvent{}
