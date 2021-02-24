import 'package:flutter/material.dart';

import '../../screens/calls_screen/calls_screen.dart';
import '../../screens/camera_screen/camera_screen.dart';
import '../../screens/chat_screen/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s Chat'),
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
          children: [CameraScreen(), ChatScreen(), CallsScreen()],
        ),
      ),
    );
  }
}
