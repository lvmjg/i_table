part of 'place_search_bloc.dart';

abstract class PlaceSearchState {}

class PlaceSearchFetchFailure extends PlaceSearchState {
  final String errorMessage;

  PlaceSearchFetchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PlaceSearchFetchInProgress extends PlaceSearchState {
  PlaceSearchFetchInProgress();

  @override
  List<Object> get props => [];
}

class PlaceSearchFetchSuccess extends PlaceSearchState {
  final List<PlaceSearch> places;

  PlaceSearchFetchSuccess({required this.places});

  @override
  List<Object> get props => [places];
}
