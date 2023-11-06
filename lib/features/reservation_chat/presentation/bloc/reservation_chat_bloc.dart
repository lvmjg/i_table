import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_message.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_messages_factory.dart';
import 'package:i_table/features/reservation_chat/domain/usecase/fetch_chat_messages.dart';
import 'package:i_table/features/user_reservations/domain/usecase/fetch_user_reservations.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../data/data_source/reservation_chat_remote_data_source.dart';
import '../../data/repository/reservation_chat_repository.dart';
import '../../domain/usecase/add_chat_message.dart';

part 'reservation_chat_event.dart';
part 'reservation_chat_state.dart';

class ReservationChatBloc
    extends Bloc<ReservationChatEvent, ReservationChatState> {

  String? currentPlaceId;
  String? currentReservationId;

  ReservationChatBloc() : super(ReservationChatFetchInProgress()) {
    FetchChatMessages fetchChatMessages = FetchChatMessages(
        ReservationChatRepositoryImpl(
            ReservationChatRemoteDataSourceImpl(), ChatMessagesFactory()));

    AddChatMessage addChatMessage = AddChatMessage(
        ReservationChatRepositoryImpl(
            ReservationChatRemoteDataSourceImpl(), ChatMessagesFactory()));

    on<ReservationChatInitiated>((event, emit) async {
      emit(ReservationChatFetchInProgress());

      Stream<List<ChatMessage>>? chatMessagesStream;

      (await fetchChatMessages(ReservationParams(
              placeId: event.placeId, reservationId: event.reservationId)))
          .fold(
              (failure) {
                currentPlaceId = null;
                currentReservationId = null;
                emit(ReservationChatFetchFailure(errorMessage: errorFetchData));
              },
              (newChatMessagesStream) {
        currentPlaceId = event.placeId;
        currentReservationId = event.reservationId;
        chatMessagesStream = newChatMessagesStream;
      });

      if (chatMessagesStream != null) {
        await emit.forEach(chatMessagesStream!,
            onData: (List<ChatMessage> chatMessages) {
              chatMessages.sort((a,b) => a.sendTime.compareTo(b.sendTime));
              return ReservationChatFetchSuccess(chatMessages: chatMessages);
            });

      }
    }, transformer: restartable());

    on<ReservationChatAddMessageRequested>((event, emit) async {
      if(currentPlaceId!=null && currentReservationId!=null) {
        emit(ReservationChatAddMessageInProgress());

        (await addChatMessage(ReservationChatAddMessageRequestedParams(
            reservationId: currentReservationId!,
            chatMessage: event.chatMessage)))
            .fold(
                (failure) =>
                emit(
                    ReservationChatAddMessageFailure(
                        errorMessage: errorFetchData)),
                (emptyVoid) => emit(
                      ReservationChatAddMessageSuccess())

            );
      }
    });
  }
}
