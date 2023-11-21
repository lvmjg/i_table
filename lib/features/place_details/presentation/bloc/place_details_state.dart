part of 'place_details_bloc.dart';

abstract class PlaceDetailsState {}

class PlaceDetailsFetchFailure extends PlaceDetailsState {
  final String placeId;
  final String errorMessage;

  PlaceDetailsFetchFailure({required this.placeId, required this.errorMessage});
}

class PlaceDetailsFetchInProgress extends PlaceDetailsState {
  PlaceDetailsFetchInProgress();

}

class PlaceDetailsFetchSuccess extends PlaceDetailsState {
  final PlaceDetails placeDetails;

  PlaceDetailsFetchSuccess({required this.placeDetails});
}