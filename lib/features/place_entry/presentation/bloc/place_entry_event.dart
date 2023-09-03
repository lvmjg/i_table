part of 'place_entry_bloc.dart';

@immutable
abstract class PlaceEntryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PlaceEntryInitiated extends PlaceEntryEvent {
  final String placeId;

  PlaceEntryInitiated({required this.placeId});

  @override
  List<Object> get props => [placeId];
}
