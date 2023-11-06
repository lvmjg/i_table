part of 'place_menu_bloc.dart';

@immutable
abstract class PlaceMenuState extends Equatable{}

class PlaceMenuFetchFailure extends PlaceMenuState {
  final String errorMessage;

  PlaceMenuFetchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PlaceMenuFetchInProgress extends PlaceMenuState {
  PlaceMenuFetchInProgress();


  @override
  List<Object> get props => [];
}

class PlaceMenuFetchSuccess extends PlaceMenuState {
  final String placeId;
  final PlaceMenu placeMenu;
  final List<PlaceMenuItem> basket;
  final String basketTotal;
  late final DateTime trigger;

  PlaceMenuFetchSuccess({required this.placeId, required this.placeMenu, required this.basket, required this.basketTotal}){
    trigger = DateTime.now();
  }

  @override
  List<Object> get props => [trigger, basket];
}

class PlaceMenuSubmitOrderFailure extends PlaceMenuState {
  final String errorMessage;

  PlaceMenuSubmitOrderFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PlaceMenuSubmitOrderInProgress extends PlaceMenuState {
  PlaceMenuSubmitOrderInProgress();

  @override
  List<Object> get props => [];
}

class PlaceMenuSubmitOrderSuccess extends PlaceMenuState {
  PlaceMenuSubmitOrderSuccess();

  @override
  List<Object> get props => [];
}

