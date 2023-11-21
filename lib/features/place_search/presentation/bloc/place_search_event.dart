part of 'place_search_bloc.dart';

@immutable
abstract class PlaceSearchEvent {}

class PlaceSearchInitiated extends PlaceSearchEvent {}

class PlaceSearchInputProvided extends PlaceSearchEvent {
  final String input;

  PlaceSearchInputProvided({required this.input});
}
