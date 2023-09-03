part of 'place_menu_bloc.dart';

@immutable
abstract class PlaceMenuEvent {}

class PlaceMenuInitiated extends PlaceMenuEvent {
  final String placeId;

  PlaceMenuInitiated({required this.placeId});
}