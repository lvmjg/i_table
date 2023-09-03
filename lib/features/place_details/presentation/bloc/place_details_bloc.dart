import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_table/features/place_details/domain/entities/place_details_factory.dart';
import 'package:i_table/features/place_search/presentation/bloc/place_search_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../data/datasources/place_details_remote_data_source.dart';
import '../../data/repositories/place_details_repository.dart';
import '../../domain/entities/place_details.dart';
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
