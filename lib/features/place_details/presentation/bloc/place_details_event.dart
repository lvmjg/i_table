part of 'place_details_bloc.dart';

@immutable
abstract class PlaceDetailsEvent {}

class PlaceDetailsInitiated extends PlaceDetailsEvent {
  final String placeId;

  PlaceDetailsInitiated({required this.placeId});
}
