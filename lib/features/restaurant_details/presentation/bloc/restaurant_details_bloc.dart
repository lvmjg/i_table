import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_details_entity.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/resturant_details_usecase.dart';

part 'restaurant_details_event.dart';
part 'restaurant_details_state.dart';

class RestaurantDetailsBloc extends Bloc<RestaurantDetailsEvent, RestaurantDetailsState> {
  RestaurantDetailsBloc() : super(RestaurantDetailsFetchInProgress()) {

    RestaurantDetailsUseCase restaurantDetailsUseCase = new RestaurantDetailsUseCase();

    on<RestaurantDetailsInit>((event, emit) async {
      emit(RestaurantDetailsFetchInProgress());

      RestaurantDetailsEntity? fetchedRestaurantDetails = await restaurantDetailsUseCase.fetchRestaurantDetails(event.restaurantId);

      if(fetchedRestaurantDetails!=null) {
        if (state is RestaurantDetailsFetchInProgress) {
          emit(RestaurantDetailsFetchSuccess(
              restaurantDetails: fetchedRestaurantDetails));
        }
      }

    });
  }
}
