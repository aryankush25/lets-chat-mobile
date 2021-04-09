import 'package:flutter/material.dart';

class Chat {
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
}
