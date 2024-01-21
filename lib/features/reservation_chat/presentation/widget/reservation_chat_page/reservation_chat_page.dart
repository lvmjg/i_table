import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/util/globals.dart';
import '../../../../../core/widget/common_page.dart';
import '../../bloc/reservation_chat_bloc.dart';
import 'app_bar/reservation_chat_app_bar.dart';
import 'body/reservation_chat_body.dart';

class ReservationChatPage extends StatelessWidget {
  final String placeId;
  final String reservationId;

  const ReservationChatPage(
      {Key? key, required this.placeId, required this.reservationId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReservationChatBloc>(
      create: (context) => ReservationChatBloc(
          placeId: placeId, reservationId: reservationId),
      child: BlocBuilder<ReservationChatBloc, ReservationChatState>(
        builder: (context, state) {
          return CommonPage(
            bloc: context.read<ReservationChatBloc>(),
            child: Scaffold(
              appBar: ReservationChatAppBar(title: serviceChat),
              body: ReservationChatBody(),
            ),
          );
        },
      ),
    );
  }
}
