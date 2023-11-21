part of 'place_bloc.dart';

@immutable
abstract class PlaceState {
  @override
  List<Object> get props => [];
}

class PlaceFetchFailure extends PlaceState {
  final String placeId;
  final DateTime reservationDateTime;
  final Duration reservationDuration;
  final String errorMessage;

  PlaceFetchFailure({required this.placeId, required this.reservationDateTime, required this.reservationDuration, required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PlaceFetchInProgress extends PlaceState {
  PlaceFetchInProgress();
}

class PlaceFetchSuccess extends PlaceState {
  final PlaceConfigurationEntity? placeConfiguration;
  final bool editMode;
  final bool readyToReserve;
  late final DateTime trigger;

  PlaceFetchSuccess({required this.placeConfiguration, required this.editMode, required this.readyToReserve}){
    trigger = DateTime.now();
  }

  @override
  List<Object> get props => [trigger];
}