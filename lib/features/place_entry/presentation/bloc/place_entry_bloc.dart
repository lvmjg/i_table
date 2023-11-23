import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../../../core/widget/common_page.dart';
import '../../data/data_source/place_settings_remote_data_source.dart';
import '../../data/repository/place_settings_repository.dart';
import '../../domain/entity/place_settings.dart';
import '../../domain/entity/place_settings_factory.dart';
import '../../domain/usecase/fetch_place_settings.dart';

part 'place_entry_event.dart';

part 'place_entry_state.dart';

class PlaceEntryBloc extends Bloc<PlaceEntryEvent, PlaceEntryState> {
  PlaceEntryBloc() : super(PlaceEntryFetchInProgress()) {
    FetchPlaceSettings fetchPlaceSettings = FetchPlaceSettings(
        PlaceSettingsRepositoryImpl(
            PlaceSettingsRemoteDataSourceImpl(), PlaceSettingsFactory()));

    on<PlaceEntryInitiated>((event, emit) async {
      emit(PlaceEntryFetchInProgress());

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      (await fetchPlaceSettings(PlaceIdParams(placeId: event.placeId))).fold(
          (failure) => emit(PlaceEntryFetchFailure(
              placeId: event.placeId, errorMessage: errorFetchPlaceSettings)),
          (placeSettings) => emit(PlaceEntryFetchSuccess(
              placeId: event.placeId,
              placeName: '147 Break',
              placeSettings: placeSettings)));
    });
  }
}
