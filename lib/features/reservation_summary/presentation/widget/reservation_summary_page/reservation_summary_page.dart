import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_table/core/util/snack_bar_util.dart';
import 'package:i_table/features/place_plan/presentation/bloc/place_bloc.dart';
import 'package:i_table/features/reservation_summary/presentation/widget/reservation_summary_page/body/reservation_summary_body.dart';

import '../../../../../core/util/globals.dart';
import '../../../../../core/widget/common_page.dart';
import '../../../../home/presentation/widget/home_page/home_page.dart';
import '../../../../place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../../bloc/reservation_summary_bloc.dart';
import 'app_bar/reservation_summary_app_bar.dart';

class ReservationSummaryPage extends StatefulWidget {
  const ReservationSummaryPage({Key? key}) : super(key: key);

  @override
  State<ReservationSummaryPage> createState() => _ReservationSummaryPageState();
}

class _ReservationSummaryPageState extends State<ReservationSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ReservationSummaryBloc, ReservationSummaryState>(
      listener: (context, state) {
        if (state is ReservationSummarySubmitSuccess) {
          GoRouter.of(context).go('/userDashboard');

          SnackBarUtil.showSnackBar(this.context, submitReservationSuccess);
        }
      },
      child: CommonPage(
        bloc: context.read<ReservationSummaryBloc>(),
        child: Scaffold(
          appBar: ReservationSummaryAppBar(
            title: reservationSummary,
          ),
          body: const ReservationSummaryBody(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    PlaceReservation placeReservation =
        context.read<PlaceBloc>().managePlace.requestedReservation;
    context
        .read<ReservationSummaryBloc>()
        .add(ReservationSummaryInitiated(reservation: placeReservation));
  }
}
