import 'package:flutter/material.dart';
import 'package:i_table/features/user_reservations/presentation/widget/reservation_details_page/reservation_details_app_bar/reservation_details_app_bar.dart';
import 'package:i_table/features/user_reservations/presentation/widget/reservation_details_page/reservation_details_body/reservation_details_body.dart';

import '../../../../../core/util/globals.dart';
import '../../../../../core/widget/common_page.dart';

class ReservationDetailsPage extends StatelessWidget {
  final String placeName;
  final int index;

  const ReservationDetailsPage(
      {Key? key, required this.placeName, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      child: Scaffold(
        appBar: ReservationDetailsAppBar(title: reservationDetails),
        body: ReservationDetailsBody(index: index),
      ),
    );
  }
}
