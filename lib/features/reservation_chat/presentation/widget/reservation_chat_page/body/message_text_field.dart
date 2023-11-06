import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/text_field_extended.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_message.dart';

import '../../../../../../core/util/globals.dart';
import '../../../bloc/reservation_chat_bloc.dart';

class MessageTextField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  MessageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationChatBloc, ReservationChatState>(
        builder: (context, state) {
      return TextFieldExtended(
        hintText: messageBarHint,
        icon: Icons.send_rounded,
        isLoading: state is ReservationChatAddMessageInProgress,
        onIconPressed: () {
          if (controller.text.isNotEmpty) {
            context.read<ReservationChatBloc>().add(
                ReservationChatAddMessageRequested(
                    chatMessage: ChatMessage(
                        sender: loggedUserId,
                        sendTime: DateTime.now(),
                        message: controller.text)));
          }
        },
        controller: controller,
      );
    });
  }
}
