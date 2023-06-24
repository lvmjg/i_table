part of 'panorama_bloc.dart';

@immutable
abstract class PanoramaEvent{

  @override
  List<Object> get props => [];
}

class PanoramaInit extends PanoramaEvent{

  final String restaurantId;
  final String elementId;

  PanoramaInit({required this.restaurantId, required this.elementId});
}
