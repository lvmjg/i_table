part of 'panorama_bloc.dart';

@immutable
abstract class PanoramaEvent {}

class PanoramaInitiated extends PanoramaEvent {
  final String placeId;
  final String elementId;

  PanoramaInitiated({required this.placeId, required this.elementId});
}
