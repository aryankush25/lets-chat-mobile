import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final bool isEmailVerified;
  final bool isOnline;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final String token;

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
        token
      ];

  static const empty = User(id: '-');

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isEmailVerified: json['isEmailVerified'],
      isOnline: json['isOnline'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      token: json['token'],
    );
  }
}
