part of 'place_details_bloc.dart';

@immutable
abstract class PlaceDetailsEvent extends Equatable{

  @override
  List<Object> get props => [];
}


class PlaceDetailsInitiated extends PlaceDetailsEvent{

  final String placeId;

  PlaceDetailsInitiated({required this.placeId});

  @override
  List<Object> get props => [];
}

