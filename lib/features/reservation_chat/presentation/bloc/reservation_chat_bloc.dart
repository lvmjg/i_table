import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_message.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_messages_factory.dart';
import 'package:i_table/features/reservation_chat/domain/usecase/fetch_chat_messages.dart';
import 'package:i_table/features/user_reservations/domain/usecase/fetch_user_reservations.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../../../core/widget/common_page.dart';
import '../../data/data_source/reservation_chat_remote_data_source.dart';
import '../../data/repository/reservation_chat_repository.dart';
import '../../domain/usecase/add_chat_message.dart';

part 'reservation_chat_event.dart';
part 'reservation_chat_state.dart';

class ReservationChatBloc
    extends Bloc<ReservationChatEvent, ReservationChatState> {
  String? placeId;
  String? reservationId;
  Stream<List<ChatMessage>>? chatMessagesStream;

  ReservationChatBloc({required this.placeId, required this.reservationId}) : super(ReservationChatFetchInProgress()) {

    FetchChatMessages fetchChatMessages = FetchChatMessages(
        ReservationChatRepositoryImpl(
            ReservationChatRemoteDataSourceImpl(), ChatMessagesFactory()));

    AddChatMessage addChatMessage = AddChatMessage(
        ReservationChatRepositoryImpl(
            ReservationChatRemoteDataSourceImpl(), ChatMessagesFactory()));

    on<ReservationChatInitiated>((event, emit) async {
      emit(ReservationChatFetchInProgress());

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      fetchChatMessages(ReservationParams(
              placeId: placeId!, reservationId: reservationId!))
          .fold((failure) {
        emit(ReservationChatFetchFailure(
            params: ErrorParams(errorMessage: errorFetchData)));
      }, (newChatMessagesStream) {
        chatMessagesStream = newChatMessagesStream;
      });

      if (chatMessagesStream != null) {
        await emit.forEach(chatMessagesStream!,
            onData: (List<ChatMessage> chatMessages) {
              log('Chat new data');
          chatMessages.sort((a, b) => a.sendTime.compareTo(b.sendTime));
          return ReservationChatFetchSuccess(messages: chatMessages);
        });
      }
    }, transformer: restartable());

    on<ReservationChatAddMessageRequested>((event, emit) async {
      if (placeId != null && reservationId != null) {
        emit(ReservationChatAddMessageInProgress());

        if (debug) {
          await Future.delayed(Duration(seconds: TEST_TIMEOUT));
        }

        (await addChatMessage(ReservationChatMessageParams(
                reservationId: reservationId!,
                chatMessage: event.message)))
            .fold(
                (failure) => emit(ReservationChatAddMessageFailure(
                    params: ErrorParams(errorMessage: errorFetchData))),
                (emptyVoid) => emit(ReservationChatAddMessageSuccess()));
      }
    });

    _onCreate();
  }

  void _onCreate(){
    this.add(ReservationChatInitiated());
  }
  @override
  Future<void> close() async {
    log('Chat closed');

    super.close();
  }
}
