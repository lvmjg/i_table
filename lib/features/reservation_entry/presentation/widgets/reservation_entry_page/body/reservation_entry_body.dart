import 'package:flutter/material.dart';
import 'package:i_table/features/reservation_picker/presentation/widgets/reservation_date_picker.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../place_details/presentation/widgets/place_details_page/body/reserve_button.dart';
import '../../../../../place_search/domain/entities/place_search_entity.dart';
import '../../../../../reservation_picker/presentation/widgets/reservation_time_picker.dart';

class ReservationEntryBody extends StatelessWidget {

  final PlaceSearchEntity place;

  const ReservationEntryBody({
    super.key, required this.place
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          place.placeName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        SizedBox(
          height: padding / 2,
        ),
        Text(
          place.placeAddress.toString(),
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w200,
              decorationColor: Colors.white,
              decoration: TextDecoration.underline,
              color: Colors.white),
        ),
        SizedBox(
          height: padding * 3,
        ),
        Text(
          chooseDate,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        SizedBox(
          height: padding / 2,
        ),
        Padding(
          padding: EdgeInsets.all(padding),
          child: ReservationDatePicker(),
        ),
        SizedBox(
          height: padding / 2,
        ),
        Text(
          chooseTime,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        SizedBox(
          height: padding / 2,
        ),
        Padding(
          padding: EdgeInsets.all(padding),
          child: ReservationTimePicker(),
        ),
        ReserveButton(place: place)
      ],
    );
  }
}
