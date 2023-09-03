import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_table/features/place_entry/domain/usecases/fetch_place_settings.dart';
import 'package:i_table/features/place_search/presentation/bloc/place_search_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../data/datasources/place_settings_remote_data_source.dart';
import '../../data/repositories/place_settings_repository.dart';
import '../../domain/entities/place_settings.dart';
import '../../domain/entities/place_settings_factory.dart';

part 'place_entry_event.dart';

part 'place_entry_state.dart';

class PlaceEntryBloc extends Bloc<PlaceEntryEvent, PlaceEntryState> {

  PlaceEntryBloc()
      : super(PlaceEntryFetchInProgress()) {

    FetchPlaceSettings fetchPlaceSettings = FetchPlaceSettings(
        PlaceSettingsRepositoryImpl(
            PlaceSettingsRemoteDataSourceImpl(), PlaceSettingsFactory()));

    on<PlaceEntryInitiated>((event, emit) async {
      emit(PlaceEntryFetchInProgress());

      if (state is PlaceEntryFetchInProgress) {
        (await fetchPlaceSettings(PlaceIdParams(placeId: event.placeId))).fold(
            (failure) => emit(
                PlaceEntryFetchFailure(
                    placeId: event.placeId,
                    errorMessage: errorFetchPlaceSettings)),
            (placeSettings) =>
                emit(PlaceEntryFetchSuccess(placeId: event.placeId, placeName: '147 Break', placeSettings: placeSettings)));
      }
    });
  }
}
