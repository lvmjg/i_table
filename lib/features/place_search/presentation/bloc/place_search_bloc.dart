import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../data/datasources/place_search_remote_data_source.dart';
import '../../data/repositories/place_search_repository.dart';
import '../../domain/entities/place_search_entity.dart';
import '../../domain/usecases/fetch_places.dart';

part 'place_search_event.dart';
part 'place_search_state.dart';

class PlaceSearchBloc extends Bloc<PlaceSearchEvent, PlaceSearchState> {
  PlaceSearchBloc() : super(PlaceSearchFetchSuccess(places: const [])) {
    FetchPlaces fetchPlaces = FetchPlaces(PlaceSearchRepositoryImpl(PlaceSearchRemoteDataSourceImpl()));

    on<PlaceSearchInitiated>((event, emit) async {
      emit(PlaceSearchFetchInProgress());

      if(state is PlaceSearchFetchInProgress) {
        (await fetchPlaces(NoParams())).fold(
                (failure) => emit(PlaceSearchFetchFailure(errorMessage: errorFetchPlaces)),
                (places) => emit(PlaceSearchFetchSuccess(places: places))
        );
      }

    });

    on<PlaceSearchInputProvided>((event, emit) async {
      if(state is PlaceSearchFetchSuccess) {
        emit(PlaceSearchFetchSuccess(places: List.of(fetchPlaces.filterPlaces(event.input))));
      }
    });


  }
}
