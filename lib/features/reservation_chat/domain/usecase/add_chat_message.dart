import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';
import 'package:i_table/features/reservation_chat/data/repository/reservation_chat_repository.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_message.dart';

class AddChatMessage implements UseCase<void, ReservationChatMessageParams> {
  final ReservationChatRepository reservationChatRepository;

  AddChatMessage(this.reservationChatRepository);

  @override
  Future<Either<Failure, void>> call(
      ReservationChatMessageParams params) async {
    return await reservationChatRepository.addChatMessage(
        params.reservationId, params.chatMessage);
  }
}
