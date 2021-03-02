import 'package:flutter/material.dart';

import './contact.dart';

class Chat {
  final Contact user;
  final String lastMessage;
  final DateTime sentTime;
  final bool sentByMe;

  const Chat({
    @required this.user,
    @required this.lastMessage,
    @required this.sentTime,
    @required this.sentByMe,
  });
}
