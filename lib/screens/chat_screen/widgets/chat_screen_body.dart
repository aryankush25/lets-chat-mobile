import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_chat_mobile/models/user_chat.dart';

import './chat_screen_text_input.dart';
import '../../../bloc/user_chats/user_chats.dart';
import '../../../models/user.dart';

class ChatScreenBody extends StatelessWidget {
  final User user;

  ChatScreenBody({
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ChatScreenTextInput(),
        BlocBuilder<UserChatsBloc, UserChatsState>(
          buildWhen: (previousState, state) {
            if (previousState is UserChatFinal && state is UserChatFinal) {
              final previousStateUserChat = previousState.userChats[user.id];
              final stateUserChat = state.userChats[user.id];

              if (!(previousStateUserChat == stateUserChat)) {
                return true;
              }
            }

            return false;
          },
          builder: (context, state) {
            if (state is UserChatFinal) {
              final userChats = state.userChats[user.id];

              if (userChats == null ||
                  userChats.status == UserChatStatus.initial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (userChats.status == UserChatStatus.failure) {
                return Center(
                  child: Text('Failed to fetch chats'),
                );
              }

              return ListView.builder(
                itemCount: userChats.chats.length,
                itemBuilder: (context, index) {
                  final chat = userChats.chats[index];

                  return Container(
                    child: Column(
                      children: [
                        Text(chat.content),
                      ],
                    ),
                  );
                },
              );
            }

            return FittedBox();
          },
        )
      ],
    );
  }
}
