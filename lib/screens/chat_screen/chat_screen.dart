import 'package:flutter/material.dart';

import '../../models/user.dart';
import './widgets/chat_screen_app_bar.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: ChatScreenAppBar(
        user: user,
      ),
    );
  }
}
