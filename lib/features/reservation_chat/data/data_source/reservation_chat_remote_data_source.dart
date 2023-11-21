import 'package:i_table/core/data_source/firebase_data_source.dart';

import '../../../../core/error/exceptions.dart';
import '../model/chat_message_model.dart';

abstract class ReservationChatRemoteDataSource {
  Stream<List<ChatMessageModel>> fetchChatMessages(
      String placeId, String reservationId);
  Future<void> addChatMessage(
      String reservationId, ChatMessageModel chatMessageModel);
}

class ReservationChatRemoteDataSourceImpl
    implements ReservationChatRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Stream<List<ChatMessageModel>> fetchChatMessages(
      String placeId, String reservationId) {
    try {
      return fds.fetchChatMessages(placeId, reservationId);
    } catch (e, s) {
      throw FetchException();
    }
  }

  @override
  Future<void> addChatMessage(
      String reservationId, ChatMessageModel chatMessageModel) async {
    try {
      await fds.addChatMessage(reservationId, chatMessageModel);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
