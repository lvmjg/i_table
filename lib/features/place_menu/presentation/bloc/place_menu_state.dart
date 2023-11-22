part of 'place_menu_bloc.dart';

@immutable
abstract class PlaceMenuState {}

class PlaceMenuFetchFailure extends PlaceMenuState {
  final String errorMessage;

  PlaceMenuFetchFailure({required this.errorMessage});
}

class PlaceMenuFetchInProgress extends PlaceMenuState {}

class PlaceMenuFetchSuccess extends PlaceMenuState {
  final String placeId;
  final PlaceMenu placeMenu;
  final List<PlaceMenuItem> basket;
  final String basketTotal;
  late final DateTime trigger;

  PlaceMenuFetchSuccess(
      {required this.placeId,
      required this.placeMenu,
      required this.basket,
      required this.basketTotal}) {
    trigger = DateTime.now();
  }
}

class PlaceMenuSubmitOrderFailure extends PlaceMenuState {
  final String errorMessage;

  PlaceMenuSubmitOrderFailure({required this.errorMessage});
}

class PlaceMenuSubmitOrderInProgress extends PlaceMenuState {
  PlaceMenuSubmitOrderInProgress();
}

class PlaceMenuSubmitOrderSuccess extends PlaceMenuState {}
