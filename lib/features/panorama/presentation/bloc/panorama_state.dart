part of 'panorama_bloc.dart';

abstract class PanoramaState {}

class PanoramaFetchFailure extends PanoramaState {
  final ErrorParams params;

  PanoramaFetchFailure({required this.params});
}

class PanoramaFetchInProgress extends PanoramaState {}

class PanoramaFetchSuccess extends PanoramaState implements SuccessState {
  final File panoramaImage;

  PanoramaFetchSuccess({required this.panoramaImage});
}
