part of 'place_menu_bloc.dart';

@immutable
abstract class PlaceMenuEvent {}

class PlaceMenuInitiated extends PlaceMenuEvent {
  final String? userId;
  final String placeId;
  final String placeName;
  final String? reservationId;

  PlaceMenuInitiated(
      {this.userId,
      required this.placeId,
      required this.placeName,
      this.reservationId});
}

class PlaceMenuItemSubtracted extends PlaceMenuEvent {
  final String menuItemCategory;
  final String menuItemId;

  PlaceMenuItemSubtracted(
      {required this.menuItemCategory, required this.menuItemId});
}

class PlaceMenuItemAdded extends PlaceMenuEvent {
  final String menuItemCategory;
  final String menuItemId;

  PlaceMenuItemAdded(
      {required this.menuItemCategory, required this.menuItemId});
}

class PlaceMenuItemRemoved extends PlaceMenuEvent {
  final String menuItemCategory;
  final String menuItemId;

  PlaceMenuItemRemoved(
      {required this.menuItemCategory, required this.menuItemId});
}

class PlaceMenuMealDateSet extends PlaceMenuEvent {
  final DateTime mealDate;

  PlaceMenuMealDateSet({required this.mealDate});
}

class PlaceMenuMealTimeSet extends PlaceMenuEvent {
  final TimeOfDay mealTime;

  PlaceMenuMealTimeSet({required this.mealTime});
}

class PlaceMenuPayChosen extends PlaceMenuEvent {
  PlaceMenuPayChosen();
}
