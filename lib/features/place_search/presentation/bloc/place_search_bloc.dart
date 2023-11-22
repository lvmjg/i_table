import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../data/data_source/place_search_remote_data_source.dart';
import '../../data/repository/place_search_repository.dart';
import '../../domain/entity/place_search.dart';
import '../../domain/entity/place_search_factory.dart';
import '../../domain/usecase/fetch_places.dart';

part 'place_search_event.dart';

part 'place_search_state.dart';

class PlaceSearchBloc extends Bloc<PlaceSearchEvent, PlaceSearchState> {
  PlaceSearchBloc() : super(PlaceSearchFetchSuccess(places: const [])) {
    FetchPlaces fetchPlaces = FetchPlaces(PlaceSearchRepositoryImpl(
        PlaceSearchRemoteDataSourceImpl(), PlaceSearchFactory()));

    on<PlaceSearchInitiated>((event, emit) async {
      emit(PlaceSearchFetchInProgress());

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      if (state is PlaceSearchFetchInProgress) {
        (await fetchPlaces(NoParams())).fold(
            (failure) =>
                emit(PlaceSearchFetchFailure(errorMessage: errorFetchPlaces)),
            (places) => emit(PlaceSearchFetchSuccess(places: places)));
      }
    });

    on<PlaceSearchInputProvided>((event, emit) async {
      if (state is PlaceSearchFetchSuccess) {
        emit(PlaceSearchFetchSuccess(
            places: List.of(fetchPlaces.filterPlaces(event.input))));
      }
    });
  }
}
