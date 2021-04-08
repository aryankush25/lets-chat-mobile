import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/user.dart';

final String baseUrl = env['BASE_URL'];

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
      Uri.https(baseUrl, 'login'),
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

  Future<User> me({
    @required String token,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
      Uri.https(baseUrl, 'me'),
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
