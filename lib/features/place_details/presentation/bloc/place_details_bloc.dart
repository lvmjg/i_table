import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../data/data_source/place_details_remote_data_source.dart';
import '../../data/repository/place_details_repository.dart';
import '../../domain/entity/place_details.dart';
import '../../domain/entity/place_details_factory.dart';
import '../../domain/usecase/fetch_place_details.dart';

part 'place_details_event.dart';

part 'place_details_state.dart';

class PlaceDetailsBloc extends Bloc<PlaceDetailsEvent, PlaceDetailsState> {
  PlaceDetailsBloc() : super(PlaceDetailsFetchInProgress()) {
    FetchPlaceDetails fetchPlaceDetails = FetchPlaceDetails(
        PlaceDetailsRepositoryImpl(
            PlaceDetailsRemoteDataSourceImpl(), PlaceDetailsFactory()));

    on<PlaceDetailsInitiated>((event, emit) async {
      emit(PlaceDetailsFetchInProgress());

      if(debug){
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      if (state is PlaceDetailsFetchInProgress) {
        (await fetchPlaceDetails(PlaceIdParams(placeId: event.placeId))).fold(
            (failure) => emit(PlaceDetailsFetchFailure(
                placeId: event.placeId, errorMessage: errorFetchPlaceDetails)),
            (placeDetails) =>
                emit(PlaceDetailsFetchSuccess(placeDetails: placeDetails)));
      }
    });
  }
}
