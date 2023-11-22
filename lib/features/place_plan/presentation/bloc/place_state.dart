part of 'place_bloc.dart';

@immutable
abstract class PlaceState {}

class PlaceFetchFailure extends PlaceState {
  final String placeId;
  final DateTime reservationDateTime;
  final Duration reservationDuration;
  final String errorMessage;

  PlaceFetchFailure({required this.placeId, required this.reservationDateTime, required this.reservationDuration, required this.errorMessage});
}

class PlaceFetchInProgress extends PlaceState {}

class PlaceFetchSuccess extends PlaceState {
  final PlaceConfigurationEntity? placeConfiguration;
  final bool editMode;
  final bool readyToReserve;
  late final DateTime trigger;

  PlaceFetchSuccess({required this.placeConfiguration, required this.editMode, required this.readyToReserve}){
    trigger = DateTime.now();
  }
}