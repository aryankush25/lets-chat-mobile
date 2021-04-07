import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';

const String base_url = 'lets-chat-server-app.herokuapp.com';

class UserRepository {
  Future<User> logIn({
    @required String email,
    @required String password,
  }) async {
    const headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'email': email,
      'password': password,
    });

    final response = await http.post(
      Uri.https(base_url, 'login'),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return User.fromJson(
        json.decode(
          response.body,
        ),
      );
    } else {
      throw Exception('Failed to load user');
    }
  }
}
