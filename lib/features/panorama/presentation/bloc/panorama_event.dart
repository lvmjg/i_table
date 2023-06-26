part of 'panorama_bloc.dart';

@immutable
abstract class PanoramaEvent{

  @override
  List<Object> get props => [];
}

class PanoramaInitiated extends PanoramaEvent{

  final String restaurantId;
  final String elementId;

  PanoramaInitiated({required this.restaurantId, required this.elementId});
}
