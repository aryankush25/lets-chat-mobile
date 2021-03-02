import 'package:flutter/material.dart';
import 'package:lets_chat_mobile/utils/constants/menu_options.dart';

import '../../models/chat.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    final chat = ModalRoute.of(context).settings.arguments as Chat;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        leadingWidth: 30,
        title: InkWell(
          onTap: () {
            print('Tap ${chat.user.name}');
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(chat.user.imageUrl),
                backgroundColor: Colors.tealAccent.shade100,
                radius: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  chat.user.name,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => CHAT_MENU_OPTIONS.map(
              (menuOption) {
                return PopupMenuItem(
                  child: Text(
                    menuOption.label,
                  ),
                  value: menuOption.id,
                );
              },
            ).toList(),
            onSelected: (value) {
              print('Selected value - $value');
            },
          ),
        ],
      ),
    );
  }
}
