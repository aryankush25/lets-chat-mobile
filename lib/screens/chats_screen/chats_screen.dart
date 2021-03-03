import 'package:flutter/material.dart';

import '../../dummy_data/chats.dart';
import '../../utils/constants/route_names.dart';
import '../../utils/helpers/date_helpers.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: dummyChats.map(
          (chat) {
            return ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Routes.CHAT,
                  arguments: chat,
                );
              },
              contentPadding: EdgeInsets.all(8),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(chat.user.imageUrl),
                backgroundColor: Colors.tealAccent.shade100,
                radius: 30,
              ),
              title: Text(
                chat.user.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                chat.lastMessage,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              trailing: Container(
                child: Column(
                  children: [
                    Text(
                      DateHelpers.formattedDate(
                        chat.sentTime,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
