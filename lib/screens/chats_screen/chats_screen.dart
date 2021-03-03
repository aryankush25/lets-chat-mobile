import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../dummy_data/chats.dart';
import '../../utils/constants/route_names.dart';

class ChatsScreen extends StatelessWidget {
  String formattedDate(DateTime sentTime) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(Duration(days: 1));

    if (sentTime.year == now.year &&
        sentTime.month == now.month &&
        sentTime.day == now.day) {
      return DateFormat.jm().format(sentTime);
    }

    if (sentTime.year == yesterday.year &&
        sentTime.month == yesterday.month &&
        sentTime.day == yesterday.day) {
      return 'Yesterday';
    }

    return DateFormat(
      'd/M/yy',
    ).format(
      sentTime,
    );
  }

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
                      formattedDate(
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
