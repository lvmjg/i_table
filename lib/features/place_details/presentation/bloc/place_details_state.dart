part of 'place_details_bloc.dart';

abstract class PlaceDetailsState extends Equatable {

  @override
  List<Object?> get props => [];
}


class PlaceDetailsFetchFailure extends PlaceDetailsState {
  final String placeId;
  final String errorMessage;

  PlaceDetailsFetchFailure({required this.placeId, required this.errorMessage});

  @override
  List<Object> get props => [placeId, errorMessage];
}

class PlaceDetailsFetchInProgress extends PlaceDetailsState {
  PlaceDetailsFetchInProgress();

}

class PlaceDetailsFetchSuccess extends PlaceDetailsState {
  final PlaceDetails placeDetails;

  PlaceDetailsFetchSuccess({required this.placeDetails});

  @override
  List<Object> get props => [placeDetails];
}