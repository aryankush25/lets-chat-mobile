import 'package:flutter/material.dart';
import '../../../models/user.dart';
import '../../../models/user_chat.dart';
import './chat_list_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    Key key,
    @required this.userChats,
    @required this.user,
  }) : super(key: key);

  final UserChat userChats;
  final User user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userChats.chats.length,
      itemBuilder: (context, index) {
        final chat = userChats.chats[index];

        return ChatListItem(
          chat: chat,
          user: user,
        );
      },
    );
  }
}
