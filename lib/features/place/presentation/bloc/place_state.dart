part of 'place_bloc.dart';

abstract class PlaceState extends Equatable {
  @override
  List<Object> get props => [];
}

class PlaceFetchFailure extends PlaceState {
  final String errorMessage;

  PlaceFetchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PlaceFetchInProgress extends PlaceState {
  PlaceFetchInProgress();
}

class PlaceFetchSuccess extends PlaceState {
  final PlaceConfigurationEntity placeConfiguration;
  final String input;

  final bool editMode;

  PlaceFetchSuccess({required this.placeConfiguration, required this.input, required this.editMode});

  @override
  List<Object> get props => [placeConfiguration, input, editMode];
}

