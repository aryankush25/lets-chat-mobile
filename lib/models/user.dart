import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import './chat.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final bool isEmailVerified;
  final bool isOnline;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;
  final String token;
  final Chat latestChat;

  const User({
    @required this.id,
    this.name,
    this.email,
    this.isEmailVerified,
    this.isOnline,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.token,
    this.latestChat,
  });

  @override
  List<Object> get props => [
        id,
        name,
        email,
        isEmailVerified,
        isOnline,
        createdAt,
        updatedAt,
        deletedAt,
        token,
        latestChat,
      ];

  static const empty = User(id: '-');

  factory User.fromJson(Map<String, dynamic> json) {
    var latestChats = json['latestChat'];
    var createdAt = json['createdAt'];
    var updatedAt = json['updatedAt'];
    var deletedAt = json['deletedAt'];

    if (latestChats != null) {
      latestChats = Chat.fromJson(latestChats);
    }

    createdAt = createdAt != null ? DateTime.parse(createdAt) : null;
    updatedAt = updatedAt != null ? DateTime.parse(updatedAt) : null;
    deletedAt = deletedAt != null ? DateTime.parse(deletedAt) : null;

    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isEmailVerified: json['isEmailVerified'],
      isOnline: json['isOnline'],
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      token: json['token'],
      latestChat: latestChats,
    );
  }
}
