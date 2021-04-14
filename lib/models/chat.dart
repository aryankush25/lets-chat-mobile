import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final String id;
  final String content;
  final String senderId;
  final String receiverId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

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
    var createdAt = json['createdAt'];
    var updatedAt = json['updatedAt'];
    var deletedAt = json['deletedAt'];

    createdAt = createdAt != null ? DateTime.parse(createdAt) : null;
    updatedAt = updatedAt != null ? DateTime.parse(updatedAt) : null;
    deletedAt = deletedAt != null ? DateTime.parse(deletedAt) : null;

    return Chat(
      id: json['id'],
      content: json['content'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}
