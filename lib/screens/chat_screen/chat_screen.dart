import 'package:flutter/material.dart';

import '../../utils/constants/menu_options.dart';
import '../../models/chat.dart';
import '../../utils/constants/route_names.dart';
import '../../utils/helpers/navigator_keys.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chat = ModalRoute.of(context).settings.arguments as Chat;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            NavigatorKeys.getChatsNavigatorKeyCurrentState.pop();
          },
        ),
        leadingWidth: 30,
        title: InkWell(
          onTap: () {
            NavigatorKeys.getChatsNavigatorKeyCurrentState.pushNamed(
              Routes.CONTACT_VIEW,
              arguments: chat.user,
            );
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
          IconButton(
            tooltip: 'Video Call',
            color: Colors.white,
            icon: Icon(Icons.videocam),
            onPressed: () {
              print('Video Call');
            },
          ),
          IconButton(
            tooltip: 'Voice Call',
            color: Colors.white,
            icon: Icon(Icons.call),
            onPressed: () {
              print('Voice Call');
            },
          ),
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
