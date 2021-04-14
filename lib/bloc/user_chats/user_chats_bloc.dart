import 'package:flutter_bloc/flutter_bloc.dart';

import './user_chats_event.dart';
import './user_chats_state.dart';
import '../../repository/user_chats_repository.dart';
import '../../models/user_chat.dart';

class UserChatsBloc extends Bloc<UserChatsEvent, UserChatsState> {
  final UserChatsRepository userChatsRepository;

  UserChatsBloc()
      : userChatsRepository = UserChatsRepository(),
        super(UserChatFinal({}));

  @override
  Stream<UserChatsState> mapEventToState(UserChatsEvent event) async* {
    if (event is UserChatsFetched) {
      yield* _mapUserChatsFetchToState(event, state);
    }
  }

  Stream<UserChatsState> _mapUserChatsFetchToState(
    UserChatsFetched event,
    UserChatFinal state,
  ) async* {
    yield state.statusChange(event.userId, UserChatStatus.initial);

    final response = await userChatsRepository.fetchUserChat(event.userId);

    if (response.success) {
      yield state.chatsChange(event.userId, response.body);
    } else {
      yield state.statusChange(event.userId, UserChatStatus.failure);
    }
  }
}
