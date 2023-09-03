import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/presentation/widgets/failure.dart';
import 'package:i_table/features/place_details/presentation/widgets/place_details_page/body/place_address.dart';
import 'package:i_table/features/place_details/presentation/widgets/place_details_page/body/place_description.dart';
import 'package:i_table/features/place_details/presentation/widgets/place_details_page/body/place_location_url.dart';
import 'package:i_table/features/place_details/presentation/widgets/place_details_page/body/place_logo.dart';
import 'package:i_table/features/place_details/presentation/widgets/place_details_page/body/place_name.dart';
import 'package:i_table/features/place_details/presentation/widgets/place_details_page/body/place_opening_hours.dart';
import 'package:i_table/features/place_details/presentation/widgets/place_details_page/body/place_url.dart';
import 'package:i_table/features/place_details/presentation/widgets/place_details_page/body/reserve_button.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../domain/entities/place_details.dart';
import '../../../bloc/place_details_bloc.dart';
import 'menu_button.dart';

class PlaceDetailsBody extends StatefulWidget {
  const PlaceDetailsBody({
    super.key,
  });

  @override
  State<PlaceDetailsBody> createState() => _PlaceDetailsBodyState();
}

class _PlaceDetailsBodyState extends State<PlaceDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceDetailsBloc, PlaceDetailsState>(
      builder: (context, state) {
        if (state is PlaceDetailsFetchFailure) {
          return Failure(
              errorMessage: errorFetchPlaceDetails,
              onPressed: () => context.read<PlaceDetailsBloc>().add(
                  PlaceDetailsInitiated(placeId: state.placeId)));
        } else if (state is PlaceDetailsFetchSuccess) {
          PlaceDetails placeDetails = state.placeDetails;

          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    PlaceLogo(),
                    SizedBox(
                      height: padding,
                    ),
                    PlaceName(placeDetails: placeDetails),
                    SizedBox(
                      height: padding / 2,
                    ),
                    PlaceAddress(placeDetails: placeDetails),
                    SizedBox(
                      height: padding,
                    ),
                    PlaceDescription(placeDetails: placeDetails),
                    SizedBox(
                      height: padding,
                    ),
                    PlaceOpeningHours(placeDetails: placeDetails),
                    SizedBox(
                      height: padding,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        flex: 2,
                        child: PlaceUrl(placeDetails: placeDetails)),
                    Flexible(
                      fit: FlexFit.loose,
                        flex: 5,
                        child: MenuButton(placeId: placeDetails.placeId)
                    ),
                    Flexible(
                        fit: FlexFit.loose,
                        flex: 5,
                        child: ReserveButton(placeId: placeDetails.placeId)
                    ),
                    Flexible(
                        flex: 2,
                        child: PlaceLocationUrl(
                            placeDetails: placeDetails)),
                  ],
                ),
              )
            ],
          );
        }
        return SizedBox(
            child: Center(
                child: CircularProgressIndicator(color: Color(primary))));
      },
    );
  }
}
