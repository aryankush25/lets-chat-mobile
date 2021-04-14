import 'package:flutter_bloc/flutter_bloc.dart';

import './chats_event.dart';
import './chats_state.dart';
import '../../repository/chats_repository.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatsRepository chatsRepository;

  ChatsBloc()
      : chatsRepository = ChatsRepository(),
        super(ChatsInitial());

  @override
  Stream<ChatsState> mapEventToState(ChatsEvent event) async* {
    if (event is ChatsFetched && state is ChatsInitial) {
      yield* _mapChatsFetchToState(state);
    } else if (event is ChatsRefetched) {
      yield ChatsInitial();

      yield* _mapChatsFetchToState(state);
    }
  }

  Stream<ChatsState> _mapChatsFetchToState(
    ChatsState state,
  ) async* {
    final response = await chatsRepository.fetchChats();

    if (response.success) {
      yield ChatsSuccess(chats: response.body);
    } else {
      yield ChatsFailure();
    }
  }
}
