import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/features/reservation_chat/data/repository/reservation_chat_repository.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_message.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/util/globals.dart';
import '../model/chat_message_model.dart';

abstract class ReservationChatRemoteDataSource {
  Stream<List<ChatMessageModel>> fetchChatMessages(String placeId, String reservationId);
  Future<void> addChatMessage(String reservationId, ChatMessageModel chatMessageModel);
}

class ReservationChatRemoteDataSourceImpl
    implements ReservationChatRemoteDataSource {
  @override
  Stream<List<ChatMessageModel>> fetchChatMessages(String placeId, String reservationId) {
    FirebaseFirestore ff = FirebaseFirestore.instance;

    Stream<List<ChatMessageModel>> chatMessageModelsStream = Stream.empty();
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> chatMessagesSnapshotsStream = ff
          .collection(pathPlacesReservations)
          .doc(reservationId)
          .collection(pathReservationChat)
          .snapshots();

      chatMessageModelsStream = chatMessagesSnapshotsStream.map((event)
        => event.docs
            .map((value) => ChatMessageModel.fromJson(value.data()))
            .toList()
      );
    } catch (e, s) {
      throw FetchException();
    }

    return chatMessageModelsStream;
  }

  @override
  Future<void> addChatMessage(String reservationId, ChatMessageModel chatMessageModel) async{
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    FirebaseFirestore ff = FirebaseFirestore.instance;
    try {
      await ff.collection(pathPlacesReservations)
          .doc(reservationId)
          .collection(pathReservationChat)
          .add(chatMessageModel.toJson());
    } catch(e, s){
      throw FetchException();
    }
  }
}