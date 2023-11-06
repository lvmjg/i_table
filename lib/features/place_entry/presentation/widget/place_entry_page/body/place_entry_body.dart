import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/snack_bar_util.dart';

import '../../../../../../core/widget/common_failure.dart';
import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/common_loading.dart';
import '../../../../../reservation_picker/presentation/bloc/reservation_picker_bloc.dart';
import '../../../../../reservation_picker/presentation/widget/reservation_date_picker.dart';
import '../../../../../reservation_picker/presentation/widget/reservation_duration_picker.dart';
import '../../../../../reservation_picker/presentation/widget/reservation_time_picker.dart';
import '../../../../domain/entity/place_settings.dart';
import '../../../bloc/place_entry_bloc.dart';
import 'choose_places_button.dart';

class PlaceEntryBody extends StatelessWidget {
  const PlaceEntryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReservationPickerBloc, ReservationPickerState>(
      listener: (context, state) {
        if (state is ReservationPickerChange) {
          SnackBarUtil.showSnackBar(context, state.data.error);
        }
      },
      child: BlocBuilder<PlaceEntryBloc, PlaceEntryState>(
        builder: (context, state) {
          if (state is PlaceEntryFetchFailure) {
            return CommonFailure(
                onPressed: () => context
                    .read<PlaceEntryBloc>()
                    .add(PlaceEntryInitiated(placeId: state.placeId)));
          } else if (state is PlaceEntryFetchSuccess) {
            PlaceSettings placeSettings =
                (state as PlaceEntryFetchSuccess).placeSettings;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.placeName,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: primaryColor),
                ),
                SizedBox(
                  height: padding * 3,
                ),
                Text(
                  chooseDate,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: padding,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding * 3),
                  child: ReservationDatePicker(),
                ),
                SizedBox(
                  height: padding * 2,
                ),
                Text(
                  chooseTime,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: padding / 3,
                ),
                BlocBuilder<ReservationPickerBloc, ReservationPickerState>(
                  builder: (context, state) {
                    if (state is ReservationPickerChange) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Godziny pracy',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic)),
                          SizedBox(width: padding,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(
                              'Dzisiaj: ${state.data.todaysWorkingHours}',
                              style: TextStyle(fontSize: 10)),
                          Text('Jutro: ${state.data.tomorrowsWorkingHours}',
                              style: TextStyle(fontSize: 10, color: Colors.black38))
                            ],
                          )
                        ],
                      );
                    }
                    return SizedBox(
                        child: Center(
                            child: CircularProgressIndicator(
                                color: primaryColor)));
                  },
                ),
                SizedBox(
                  height: padding / 3,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding * 3),
                  child: ReservationTimePicker(),
                ),
                SizedBox(
                  height: padding * 2,
                ),
                Text(
                  chooseDuration,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: padding,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding * 3),
                  child: ReservationDurationPicker(),
                ),
                SizedBox(
                  height: padding * 2,
                ),
                ChoosePlacesButton(placeId: state.placeId)
              ],
            );
          }

          return const CommonLoading();
        },
      ),
    );
  }
}
