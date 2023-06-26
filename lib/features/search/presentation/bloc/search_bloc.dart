import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:i_table/features/search/data/datasources/search_remote_data_source.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../data/repositories/search_repository.dart';
import '../../domain/entities/search_entity.dart';
import '../../domain/usecases/fetch_restaurants.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchFetchSuccess(restaurants: const [])) {
    FetchRestaurants fetchRestaurants = FetchRestaurants(SearchRepositoryImpl(SearchRemoteDataSourceImpl()));

    on<SearchInitiated>((event, emit) async {
      emit(SearchFetchInProgress());

      if(state is SearchFetchInProgress) {
        (await fetchRestaurants(NoParams())).fold(
                (failure) => emit(SearchFetchFailure(errorMessage: errorFetchRestaurants)),
                (restaurants) => emit(SearchFetchSuccess(restaurants: restaurants))
        );
      }

    });

    on<SearchInputProvided>((event, emit) async {
      if(state is SearchFetchSuccess) {
        emit(SearchFetchSuccess(restaurants: List.of(fetchRestaurants.filterRestaurants(event.input))));
      }
    });


  }
}
