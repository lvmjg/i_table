import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_table/features/restaurant_details/data/datasources/restaurant_details_remote_data_source.dart';
import 'package:i_table/features/restaurant_details/data/repositories/restaurant_details_repository_impl.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_details_entity.dart';
import 'package:i_table/features/restaurant_details/domain/usecase/fetch_restaurant_details.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/globals.dart';

part 'restaurant_details_event.dart';

part 'restaurant_details_state.dart';

class RestaurantDetailsBloc
    extends Bloc<RestaurantDetailsEvent, RestaurantDetailsState> {
  RestaurantDetailsBloc() : super(RestaurantDetailsFetchInProgress()) {
    FetchRestaurantDetails fetchRestaurantDetails = FetchRestaurantDetails(
        RestaurantDetailsRepositoryImpl(
            RestaurantDetailsRemoteDataSourceImpl()));

    on<RestaurantDetailsInit>((event, emit) async {
      emit(RestaurantDetailsFetchInProgress());

      if (state is RestaurantDetailsFetchInProgress) {
        (await fetchRestaurantDetails(
                RestaurantIdParams(restaurantId: event.restaurantId)))
            .fold(
                (failure) => emit(RestaurantDetailsFetchFailure(
                    errorMessage: errorFetchRestaurantDetails)),
                (restaurantDetails) => emit(RestaurantDetailsFetchSuccess(
                    restaurantDetails: restaurantDetails)));
      }
    });
  }
}
