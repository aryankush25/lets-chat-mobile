import 'package:flutter/material.dart';
import '../../../models/user.dart';
import '../../../models/chat.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({
    Key key,
    @required this.chat,
    @required this.user,
  }) : super(key: key);

  final Chat chat;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 14,
        right: 14,
        top: 10,
        bottom: 10,
      ),
      child: Align(
        alignment:
            (chat.senderId == user.id ? Alignment.topLeft : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (chat.senderId == user.id
                ? Colors.blueGrey.shade600
                : Theme.of(context).primaryColor),
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            chat.content,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
