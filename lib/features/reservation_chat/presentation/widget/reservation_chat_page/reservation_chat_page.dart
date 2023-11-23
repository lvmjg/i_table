import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/util/globals.dart';
import '../../../../../core/widget/common_page.dart';
import '../../bloc/reservation_chat_bloc.dart';
import 'app_bar/reservation_chat_app_bar.dart';
import 'body/reservation_chat_body.dart';

class ReservationChatPage extends StatefulWidget {
  final String placeId;
  final String reservationId;

  const ReservationChatPage(
      {Key? key, required this.placeId, required this.reservationId})
      : super(key: key);

  @override
  State<ReservationChatPage> createState() => _ReservationChatPageState();
}

class _ReservationChatPageState extends State<ReservationChatPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      bloc: context.read<ReservationChatBloc>(),
      child: Scaffold(
        appBar: ReservationChatAppBar(title: serviceChat),
        body: ReservationChatBody(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<ReservationChatBloc>().add(ReservationChatInitiated(
        placeId: widget.placeId, reservationId: widget.reservationId));
  }
}
