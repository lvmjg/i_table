part of 'place_menu_bloc.dart';

@immutable
abstract class PlaceMenuState {}

class PlaceMenuFetchFailure extends PlaceMenuState {
  final String errorMessage;

  PlaceMenuFetchFailure({required this.errorMessage});
}

class PlaceMenuFetchInProgress extends PlaceMenuState {
  PlaceMenuFetchInProgress();
}

class PlaceMenuFetchSuccess extends PlaceMenuState {
  final String placeId;
  final PlaceMenu placeMenu;

  PlaceMenuFetchSuccess({required this.placeId, required this.placeMenu});
}