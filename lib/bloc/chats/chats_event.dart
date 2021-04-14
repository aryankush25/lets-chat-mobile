import 'package:equatable/equatable.dart';

abstract class ChatsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChatsFetched extends ChatsEvent {}

class ChatsRefetched extends ChatsEvent {}
