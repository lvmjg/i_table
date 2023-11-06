import 'package:i_table/features/reservation_chat/data/model/chat_message_model.dart';

import 'chat_message.dart';

class ChatMessagesFactory{
  List<ChatMessage> getChatMessages(List<ChatMessageModel> chatMessageModels) {
    List<ChatMessage> chatMessages = [];

    chatMessageModels.forEach((model) {
      chatMessages.add(ChatMessage(sender: model.sender, sendTime: model.sendTime, message: model.message));
    });

    return chatMessages;
  }

  ChatMessageModel getModelFromChatMessage(ChatMessage chatMessage) {
    return ChatMessageModel(sender: chatMessage.sender, sendTime: chatMessage.sendTime, message: chatMessage.message);
  }
  
}