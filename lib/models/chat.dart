import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final String id;
  final String content;
  final String senderId;
  final String receiverId;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  const Chat({
    @required this.id,
    @required this.content,
    @required this.senderId,
    @required this.receiverId,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.deletedAt,
  });

  @override
  List<Object> get props => [
        id,
        content,
        senderId,
        receiverId,
        createdAt,
        updatedAt,
        deletedAt,
      ];

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      content: json['content'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
    );
  }
}
