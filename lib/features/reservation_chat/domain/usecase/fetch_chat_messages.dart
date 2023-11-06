import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';
import 'package:i_table/features/reservation_chat/data/repository/reservation_chat_repository.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_message.dart';

class FetchChatMessages
    implements UseCase<Stream<List<ChatMessage>>, ReservationParams> {
  final ReservationChatRepository reservationChatRepository;

  FetchChatMessages(this.reservationChatRepository);

  @override
  Future<Either<Failure, Stream<List<ChatMessage>>>> call(ReservationParams params) async {
    return await reservationChatRepository.fetchChatMessages(params.placeId, params.reservationId);
  }
}