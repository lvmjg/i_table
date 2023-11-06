import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/features/reservation_chat/data/data_source/reservation_chat_remote_data_source.dart';
import 'package:i_table/features/reservation_chat/data/model/chat_message_model.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_message.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entitiy/chat_messages_factory.dart';

abstract class ReservationChatRepository {
  Either<Failure, Stream<List<ChatMessage>>> fetchChatMessages(
      String placeId, String reservationId);

  Future<Either<Failure, void>> addChatMessage(String reservationId, ChatMessage chatMessage);
}

class ReservationChatRepositoryImpl implements ReservationChatRepository {
  final ReservationChatRemoteDataSource remote;
  final ChatMessagesFactory chatMessagesFactory;

  ReservationChatRepositoryImpl(this.remote, this.chatMessagesFactory);

  @override
  Either<Failure, Stream<List<ChatMessage>>> fetchChatMessages(
      String placeId, String reservationId) {
    try {
      Stream<List<ChatMessageModel>> chatMessagesModelStream = remote.fetchChatMessages(placeId, reservationId);

      Stream<List<ChatMessage>> chatMessagesStream = chatMessagesModelStream.map((event) => chatMessagesFactory.getChatMessages(event));

      return Right(chatMessagesStream);
    } on FetchException {
      return Left(FetchFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addChatMessage(String reservationId, ChatMessage chatMessage) async {
    try {
      ChatMessageModel chatMessageModel = chatMessagesFactory.getModelFromChatMessage(chatMessage);
      await remote.addChatMessage(reservationId, chatMessageModel);

      return Right(null);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
