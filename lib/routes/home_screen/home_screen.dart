import 'package:flutter/material.dart';
import 'package:lets_chat_mobile/routes/contacts_screen/contacts_screen.dart';

import '../../screens/calls_screen/calls_screen.dart';
import '../../screens/camera_screen/camera_screen.dart';
import '../../screens/chat_screen/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  List<Widget> buildAppBarActions() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Icon(Icons.search),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Icon(Icons.more_vert),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s Chat'),
          actions: buildAppBarActions(),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.camera),
                text: 'CAMERA',
              ),
              Tab(
                icon: Icon(Icons.chat),
                text: 'CHATS',
              ),
              Tab(
                icon: Icon(Icons.call),
                text: 'CALLS',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CameraScreen(),
            ChatScreen(),
            CallsScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.contacts,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(
              ContactsScreen.routeName,
            );
          },
        ),
      ),
    );
  }
}
