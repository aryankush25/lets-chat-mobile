import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../models/user.dart';

abstract class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

class ChatsInitial extends ChatsState {}

class ChatsFailure extends ChatsState {}

class ChatsSuccess extends ChatsState {
  final List<User> chats;

  const ChatsSuccess({
    @required this.chats,
  });

  @override
  List<Object> get props => [chats];
}
