import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/common_failure.dart';
import 'package:i_table/core/widget/common_card.dart';
import 'package:i_table/features/reservation_chat/presentation/widget/reservation_chat_page/body/message_text_field.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/common_loading.dart';
import '../../../../domain/entitiy/chat_message.dart';
import '../../../bloc/reservation_chat_bloc.dart';

class ReservationChatBody extends StatefulWidget {
  const ReservationChatBody({
    super.key,
  });

  @override
  State<ReservationChatBody> createState() => _ReservationChatBodyState();
}

class _ReservationChatBodyState extends State<ReservationChatBody> {
  final ScrollController _scrollController = ScrollController();
  List<ChatMessage> chatMessages = [];
  Timer? scrollDownTimer;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationChatBloc, ReservationChatState>(
      listener: (context, state) {
        _startScrollDownTimer();
      },
      builder: (context, state) {
        return BlocBuilder<ReservationChatBloc, ReservationChatState>(
          builder: (context, state) {
            if (state is ReservationChatFetchFailure) {
              return CommonFailure(onPressed: () {});
            } else if (state is ReservationChatFetchInProgress) {
              return const CommonLoading();
            } else {
              chatMessages = state is ReservationChatFetchSuccess
                  ? chatMessages = state.messages
                  : chatMessages;

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: chatMessages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(padding / 2),
                            child: Wrap(
                                runAlignment: _adjustAlignment(
                                    chatMessages[index].sender),
                                crossAxisAlignment: _adjustCrossAlignment(
                                    chatMessages[index].sender),
                                direction: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: padding / 2,
                                        bottom: padding / 2,
                                        right: padding / 2),
                                    child: Text(
                                        _adjustSenderText(
                                            chatMessages[index].sender),
                                        //textAlign: TextAlign.right,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ),
                                  Tooltip(
                                      message: chatMessages[index]
                                          .sendTime
                                          .toString(),
                                      child: CommonCard(
                                        innerPadding: EdgeInsets.all(padding / 2),
                                        backgroundColor:
                                            chatMessages[index].sender ==
                                                    loggedUserId
                                                ? null
                                                : Color(0xFFFFFFF7),
                                        child: Text(chatMessages[index].message,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                        onPressed: () {},
                                      )),
                                ]),
                          );
                        }),
                  ),
                  MessageTextField()
                ],
              );
            }
          },
        );
      },
    );
  }

  void _startScrollDownTimer() {
    if (scrollDownTimer == null ||
        (scrollDownTimer != null && !scrollDownTimer!.isActive)) {
      scrollDownTimer =
          Timer.periodic(const Duration(milliseconds: 50), (timer) {
        if (_scrollController.hasClients) {
          if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent) {
            timer.cancel();
          } else {
            _scrollDown();
          }
        }
      });
    }
  }

  void _scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.fastOutSlowIn);
  }

  WrapAlignment _adjustAlignment(String sender) {
    return sender == loggedUserId ? WrapAlignment.end : WrapAlignment.start;
  }

  WrapCrossAlignment _adjustCrossAlignment(String sender) {
    return sender == loggedUserId
        ? WrapCrossAlignment.end
        : WrapCrossAlignment.start;
  }

  String _adjustSenderText(String sender) {
    return sender == loggedUserId ? me : sender;
  }
}
