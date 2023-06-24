import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/presentation/widgets/failure.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_details_entity.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/restaurant_details_page/body/reserve_button.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/restaurant_details_page/body/restaurant_address.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/restaurant_details_page/body/restaurant_description.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/restaurant_details_page/body/restaurant_location_url.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/restaurant_details_page/body/restaurant_logo.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/restaurant_details_page/body/restaurant_name.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/restaurant_details_page/body/restaurant_opening_hours.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/restaurant_details_page/body/restaurant_url.dart';

import '../../../../../../core/util/globals.dart';
import '../../../bloc/restaurant_details_bloc.dart';

class RestaurantDetailsBody extends StatefulWidget {
  const RestaurantDetailsBody({
    super.key,
    required this.restaurantId,
  });

  final String restaurantId;

  @override
  State<RestaurantDetailsBody> createState() => _RestaurantDetailsBodyState();
}

class _RestaurantDetailsBodyState extends State<RestaurantDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantDetailsBloc, RestaurantDetailsState>(
      builder: (context, state) {
        if (state is RestaurantDetailsFetchFailure) {
          return Failure(
              errorMessage: errorFetchRestaurantDetails,
              onPressed: () => context.read<RestaurantDetailsBloc>().add(
                  RestaurantDetailsInit(restaurantId: widget.restaurantId)));
        } else if (state is RestaurantDetailsFetchInProgress) {
          return SizedBox(
              child: Center(
                  child: CircularProgressIndicator(color: Color(primary))));
        } else if (state is RestaurantDetailsFetchSuccess) {
          RestaurantDetailsEntity restaurantDetails = state.restaurantDetails;

          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    RestaurantLogo(),
                    SizedBox(
                      height: padding,
                    ),
                    RestaurantName(restaurantDetails: restaurantDetails),
                    SizedBox(
                      height: padding / 2,
                    ),
                    RestaurantAddress(restaurantDetails: restaurantDetails),
                    SizedBox(
                      height: padding,
                    ),
                    RestaurantDescription(restaurantDetails: restaurantDetails),
                    SizedBox(
                      height: padding,
                    ),
                    RestaurantOpeningHours(
                        restaurantDetails: restaurantDetails),
                    SizedBox(
                      height: padding,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, padding),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: RestaurantUrl(
                            restaurantDetails: restaurantDetails)),
                    Expanded(
                        flex: 4,
                        child: ReserveButton(
                          restaurant: restaurantDetails.toSearchEntity(),
                        )),
                    Expanded(
                        flex: 2,
                        child: RestaurantLocationUrl(
                            restaurantDetails: restaurantDetails)),
                  ],
                ),
              )
            ],
          );
        }
        return Container();
      },
    );
  }
}
