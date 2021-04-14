import 'package:flutter/material.dart';

import './chat_screen_text_input.dart';

class ChatScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ChatScreenTextInput(),
      ],
    );
  }
}
