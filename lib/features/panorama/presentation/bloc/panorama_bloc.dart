import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:i_table/features/panorama/data/repositories/panorama_repository_impl.dart';
import 'package:i_table/features/panorama/domain/usecases/fetch_panorama.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/globals.dart';
import '../../data/datasources/panorama_remote_data_source.dart';

part 'panorama_event.dart';
part 'panorama_state.dart';

class PanoramaBloc extends Bloc<PanoramaEvent, PanoramaState> {
  PanoramaBloc() : super(PanoramaFetchInProgress()) {
    FetchPanorama fetchPanorama = FetchPanorama(PanoramaRepositoryImpl(PanoramaRemoteDataSourceImpl()));

    on<PanoramaInit>((event, emit) async {
      emit(PanoramaFetchInProgress());

      if (state is PanoramaFetchInProgress) {
        (await fetchPanorama(
            PanoramaParams(restaurantId: event.restaurantId, elementId: event.elementId)))
            .fold(
                (failure) => emit(PanoramaFetchFailure(
                errorMessage: errorShowPreview)),
                (panoramaImage) => emit(PanoramaFetchSuccess(panoramaImage: panoramaImage))
        );
      }
    });
  }
}
