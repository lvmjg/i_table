import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/globals.dart';
import '../../data/data_source/panorama_remote_data_source.dart';
import '../../data/repository/panorama_repository.dart';
import '../../domain/usecase/fetch_panorama.dart';

part 'panorama_event.dart';
part 'panorama_state.dart';

class PanoramaBloc extends Bloc<PanoramaEvent, PanoramaState> {
  PanoramaBloc() : super(PanoramaFetchInProgress()) {
    FetchPanorama fetchPanorama = FetchPanorama(PanoramaRepositoryImpl(PanoramaRemoteDataSourceImpl()));

    on<PanoramaInitiated>((event, emit) async {
      emit(PanoramaFetchInProgress());

      if (state is PanoramaFetchInProgress) {
        (await fetchPanorama(
            PanoramaParams(placeId: event.placeId, elementId: event.elementId)))
            .fold(
                (failure) => emit(PanoramaFetchFailure(
                errorMessage: errorShowPreview)),
                (panoramaImage) => emit(PanoramaFetchSuccess(panoramaImage: panoramaImage))
        );
      }
    });
  }
}
