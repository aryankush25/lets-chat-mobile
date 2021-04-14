import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';
import './widgets/chat_screen_app_bar.dart';
import './widgets/chat_screen_body.dart';
import '../../bloc/user_chats/user_chats.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final user = ModalRoute.of(context).settings.arguments as User;

    BlocProvider.of<UserChatsBloc>(context).add(
      UserChatsFetched(user.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: ChatScreenAppBar(
        user: user,
      ),
      body: ChatScreenBody(
        user: user,
      ),
    );
  }
}
