import 'package:equatable/equatable.dart';

abstract class UserChatsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UserChatsFetched extends UserChatsEvent {
  final String userId;

  UserChatsFetched(this.userId);

  @override
  List<Object> get props => [userId];
}
