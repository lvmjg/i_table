part of 'place_search_bloc.dart';

abstract class PlaceSearchState {}

class PlaceSearchFetchFailure extends PlaceSearchState {
  final String errorMessage;

  PlaceSearchFetchFailure({required this.errorMessage});
}

class PlaceSearchFetchInProgress extends PlaceSearchState {}

class PlaceSearchFetchSuccess extends PlaceSearchState implements SuccessState {
  final List<PlaceSearch> places;

  PlaceSearchFetchSuccess({required this.places});
}
