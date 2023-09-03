import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../data/datasource/place_menu_remote_data_source.dart';
import '../../data/repository/place_menu_repository.dart';
import '../../domain/entity/place_menu.dart';
import '../../domain/entity/place_menu_factory.dart';
import '../../domain/usecase/fetch_place_menu.dart';

part 'place_menu_event.dart';

part 'place_menu_state.dart';

class PlaceMenuBloc extends Bloc<PlaceMenuEvent, PlaceMenuState> {
  PlaceMenuBloc() : super(PlaceMenuFetchInProgress()) {
    FetchPlaceMenu fetchPlaceMenu = FetchPlaceMenu(PlaceMenuRepositoryImpl(
        PlaceMenuRemoteDataSourceImpl(), PlaceMenuFactory()));

    on<PlaceMenuInitiated>((event, emit) async {
      emit(PlaceMenuFetchInProgress());

      if (state is PlaceMenuFetchInProgress) {
        (await fetchPlaceMenu(PlaceIdParams(placeId: event.placeId))).fold(
            (failure) =>
                emit(PlaceMenuFetchFailure(errorMessage: errorFetchPlaceMenu)),
            (placeMenu) => emit(PlaceMenuFetchSuccess(
                placeId: event.placeId, placeMenu: placeMenu)));
      }
    });
  }
}
