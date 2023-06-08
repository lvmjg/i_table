import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:i_table/features/search/domain/entity/search_entity.dart';
import 'package:i_table/features/search/domain/usecase/search_usecase.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchFetchSuccess(restaurants: const [])) {
    SearchUseCase searchUseCase = SearchUseCase();

    on<SearchInit>((event, emit) async {
      emit(SearchFetchInProgress());

      List<SearchEntity> fetchedRestaurants = await searchUseCase.fetchRestaurants();

      if(state is SearchFetchInProgress) {
        emit(SearchFetchSuccess(restaurants: fetchedRestaurants));
      }

    });

    on<SearchInputProvided>((event, emit) async {
      if(state is SearchFetchSuccess) {
        emit(SearchFetchSuccess(restaurants: searchUseCase.filterRestaurants(event.input)));
      }

    });


  }
}
