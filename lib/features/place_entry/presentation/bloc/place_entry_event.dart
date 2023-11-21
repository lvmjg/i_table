part of 'place_entry_bloc.dart';

@immutable
abstract class PlaceEntryEvent {}

class PlaceEntryInitiated extends PlaceEntryEvent {
  final String placeId;

  PlaceEntryInitiated({required this.placeId});
}
