import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/globals.dart';
import '../../data/datasources/place_details_remote_data_source.dart';
import '../../data/repositories/place_details_repository.dart';
import '../../domain/entity/place_details_entity.dart';
import '../../domain/usecase/fetch_place_details.dart';

part 'place_details_event.dart';

part 'place_details_state.dart';

class PlaceDetailsBloc
    extends Bloc<PlaceDetailsEvent, PlaceDetailsState> {
  PlaceDetailsBloc() : super(PlaceDetailsFetchInProgress()) {
    FetchPlaceDetails fetchPlaceDetails = FetchPlaceDetails(
        PlaceDetailsRepositoryImpl(
            PlaceDetailsRemoteDataSourceImpl()));

    on<PlaceDetailsInitiated>((event, emit) async {
      emit(PlaceDetailsFetchInProgress());

      if (state is PlaceDetailsFetchInProgress) {
        (await fetchPlaceDetails(
                PlaceIdParams(placeId: event.placeId)))
            .fold(
                (failure) => emit(PlaceDetailsFetchFailure(
                    errorMessage: errorFetchPlaceDetails)),
                (placeDetails) => emit(PlaceDetailsFetchSuccess(
                    placeDetails: placeDetails)));
      }
    });
  }
}
