part of 'place_entry_bloc.dart';

@immutable
abstract class PlaceEntryState {
  @override
  List<Object?> get props => [];
}

class PlaceEntryFetchFailure extends PlaceEntryState {
  final String placeId;
  final String errorMessage;

  PlaceEntryFetchFailure({required this.placeId, required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PlaceEntryFetchInProgress extends PlaceEntryState {
  PlaceEntryFetchInProgress();
}

class PlaceEntryFetchSuccess extends PlaceEntryState {
  final String placeId;
  final String placeName;
  final PlaceSettings placeSettings;

  PlaceEntryFetchSuccess({required this.placeId, required this.placeName, required this.placeSettings});

  @override
  List<Object> get props => [placeId, placeName, placeSettings];
}
