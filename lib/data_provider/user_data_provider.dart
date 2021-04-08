import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../services/api_service.dart';

class UserDataProvider {
  final ApiService _apiService;

  UserDataProvider() : _apiService = ApiService();

  Future<Response> logIn({
    @required String email,
    @required String password,
  }) async {
    final body = {
      'email': email,
      'password': password,
    };

    final response = await _apiService.call(
      type: ApiCallType.post,
      path: 'login',
      body: body,
      withToken: false,
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<Response> me() async {
    final response = await _apiService.call(
      type: ApiCallType.get,
      path: 'me',
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
