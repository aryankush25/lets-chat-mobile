import 'package:flutter/material.dart';

import '../calls_screen/calls_screen.dart';
import '../camera_screen/camera_screen.dart';
import '../chats_screen/chats_screen.dart';
import '../status_screen/status_screen.dart';
import '../../utils/constants/menu_options.dart';
import '../../utils/constants/route_names.dart';
import '../../utils/helpers/navigator_keys.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isClicked = false;

  toggelIsClicked() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  List<Widget> buildAppBarActions() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: IconButton(
          tooltip: 'Search Chats',
          color: Colors.white,
          icon: Icon(Icons.search),
          onPressed: () {
            print('Search');
          },
        ),
      ),
      PopupMenuButton(
        icon: Icon(Icons.more_vert),
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
      ),
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
            ChatsScreen(),
            StatusScreen(isClicked: isClicked),
            CallsScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.message,
          ),
          onPressed: () {
            toggelIsClicked();
            NavigatorKeys.getHomeNavigatorKeyCurrentState.pushNamed(
              Routes.CONTACTS,
            );
          },
        ),
      ),
    );
  }
}
