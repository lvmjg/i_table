part of 'place_search_bloc.dart';

@immutable
abstract class PlaceSearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PlaceSearchInitiated extends PlaceSearchEvent {}

class PlaceSearchInputProvided extends PlaceSearchEvent {
  final String input;

  PlaceSearchInputProvided({required this.input});

  @override
  List<Object> get props => [input];
}
