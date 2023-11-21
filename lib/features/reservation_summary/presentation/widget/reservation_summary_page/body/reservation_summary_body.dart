import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/common_failure.dart';

import '../../../../../../core/widget/common_loading.dart';
import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/reservation_card_basic_details.dart';
import '../../../../../../core/widget/reservation_card_sittings.dart';
import '../../../../../../core/widget/simple_filled_tonal_button.dart';
import '../../../bloc/reservation_summary_bloc.dart';

class ReservationSummaryBody extends StatelessWidget {
  const ReservationSummaryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationSummaryBloc, ReservationSummaryState>(
      builder: (context, state) {
        if(state is ReservationSummarySubmitFailure){
          return CommonFailure(onPressed: (){});
        }
        else if(state is ReservationSummaryInitial) {
          return Column(
            children: [
              ReservationCardBasicDetails(placeReservation: state.placeReservation, onPressed: (){}),
              ReservationCardSittings(placeReservation: state.placeReservation),
              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SimpleFilledTonalButton(title: cancel, iconData: Icons.close_rounded, iconColor: Colors.red, onPressed: (){
                      Navigator.of(context).pop();
                    }),
                    SimpleFilledTonalButton(title: submit, iconData: Icons.done_rounded, iconColor: Colors.green, onPressed: (){
                      context.read<ReservationSummaryBloc>().add(ReservationSummarySubmitted());
                    })
                  ],
                ),
              )
            ],
          );
        }

        return const CommonLoading();
      },
    );
  }
}
