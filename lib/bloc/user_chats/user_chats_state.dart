import 'package:equatable/equatable.dart';

import '../../models/chat.dart';
import '../../models/user_chat.dart';

abstract class UserChatsState extends Equatable {
  const UserChatsState();

  @override
  List<Object> get props => [];
}

class UserChatFinal extends UserChatsState {
  final Map<String, UserChat> userChats;

  UserChatFinal(this.userChats);

  UserChatFinal statusChange(String userId, UserChatStatus status) {
    final updatedUserChats = {
      ...userChats,
    };

    updatedUserChats.update(
      userId,
      (userChat) => userChat.copyWith(
        status: status,
      ),
      ifAbsent: () => UserChat(
        status: status,
      ),
    );

    return UserChatFinal(updatedUserChats);
  }

  UserChatFinal chatsChange(String userId, List<Chat> chats) {
    final updatedUserChats = {
      ...userChats,
    };

    updatedUserChats.update(
      userId,
      (userChat) => userChat.copyWith(
        chats: chats,
        status: UserChatStatus.success,
      ),
      ifAbsent: () => UserChat(
        chats: chats,
        status: UserChatStatus.success,
      ),
    );

    return UserChatFinal(updatedUserChats);
  }

  @override
  List<Object> get props => [userChats];
}
