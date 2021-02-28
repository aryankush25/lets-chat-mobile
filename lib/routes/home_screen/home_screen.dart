import 'package:flutter/material.dart';

import '../../routes/contacts_screen/contacts_screen.dart';
import '../../screens/calls_screen/calls_screen.dart';
import '../../screens/camera_screen/camera_screen.dart';
import '../../screens/chat_screen/chat_screen.dart';
import '../../screens/status_screen/status_screen.dart';
import '../../utils/constants/menu_options.dart';

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
      PopupMenuButton(
        itemBuilder: (_) => HOME_MENU_OPTIONS.map(
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
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s Chat'),
          actions: buildAppBarActions(),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CameraScreen(),
            ChatScreen(),
            StatusScreen(),
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
