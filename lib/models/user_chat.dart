import 'package:equatable/equatable.dart';
import 'package:lets_chat_mobile/models/chat.dart';

enum UserChatStatus { initial, success, failure }

class UserChat extends Equatable {
  final List<Chat> chats;
  final bool hasReachedMax;
  final UserChatStatus status;

  const UserChat({
    this.chats,
    this.hasReachedMax,
    this.status,
  });

  UserChat copyWith({
    List<Chat> chats,
    bool hasReachedMax,
    UserChatStatus status,
  }) {
    return UserChat(
      chats: chats ?? this.chats,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        chats,
        hasReachedMax,
        status,
      ];
}
