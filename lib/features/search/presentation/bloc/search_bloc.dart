import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/search_entity.dart';
import '../../domain/usecases/search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchFetchSuccess(restaurants: const [], input: StringUtil.EMPTY)) {
    SearchUseCase searchUseCase = SearchUseCase();

    on<SearchInit>((event, emit) async {
      emit(SearchFetchInProgress());

      List<SearchEntity> fetchedRestaurants = await searchUseCase.fetchRestaurants();

      if(state is SearchFetchInProgress) {
        emit(SearchFetchSuccess(restaurants: fetchedRestaurants, input: StringUtil.EMPTY));
      }

    });

    on<SearchInputProvided>((event, emit) async {
      if(state is SearchFetchSuccess) {
        emit(SearchFetchSuccess(restaurants: searchUseCase.filterRestaurants(event.input), input: event.input));
      }
    });


  }
}
