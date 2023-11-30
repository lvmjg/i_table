part of 'place_menu_bloc.dart';

@immutable
abstract class PlaceMenuState {}

class PlaceMenuFetchFailure extends PlaceMenuState {
  final String errorMessage;

  PlaceMenuFetchFailure({required this.errorMessage});
}

class PlaceMenuFetchInProgress extends PlaceMenuState {}

class PlaceMenuFetchSuccess extends PlaceMenuState implements SuccessState {
  final String placeId;
  final PlaceMenu placeMenu;
  final List<PlaceMenuItem> basket;
  final String basketTotal;
  final int basketTotalItems;
  late final DateTime trigger;

  PlaceMenuFetchSuccess(
      {required this.placeId,
      required this.placeMenu,
      required this.basket,
      required this.basketTotal,
      required this.basketTotalItems}) {
    trigger = DateTime.now();
  }
}

class PlaceMenuSubmitOrderFailure extends PlaceMenuState {
  final String errorMessage;

  PlaceMenuSubmitOrderFailure({required this.errorMessage});
}

class PlaceMenuSubmitOrderInProgress extends PlaceMenuState {}

class PlaceMenuSubmitOrderSuccess extends PlaceMenuState implements SuccessState {}
