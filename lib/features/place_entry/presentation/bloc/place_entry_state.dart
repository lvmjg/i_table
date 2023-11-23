part of 'place_entry_bloc.dart';

@immutable
abstract class PlaceEntryState {}

class PlaceEntryFetchFailure extends PlaceEntryState {
  final String placeId;
  final String errorMessage;

  PlaceEntryFetchFailure({required this.placeId, required this.errorMessage});
}

class PlaceEntryFetchInProgress extends PlaceEntryState {}

class PlaceEntryFetchSuccess extends PlaceEntryState implements SuccessState {
  final String placeId;
  final String placeName;
  final PlaceSettings placeSettings;

  PlaceEntryFetchSuccess(
      {required this.placeId,
      required this.placeName,
      required this.placeSettings});
}
