part of 'panorama_bloc.dart';

abstract class PanoramaState {
  @override
  List<Object> get props => [];
}

class PanoramaFetchFailure extends PanoramaState {
  final String errorMessage;

  PanoramaFetchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PanoramaFetchInProgress extends PanoramaState {
  PanoramaFetchInProgress();

  @override
  List<Object> get props => [];
}

class PanoramaFetchSuccess extends PanoramaState {
  final File panoramaImage;

  PanoramaFetchSuccess({required this.panoramaImage});

  @override
  List<Object> get props => [panoramaImage];
}
