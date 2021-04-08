import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../models/response.dart';
import '../services/api_service.dart';

class UserRepository {
  final ApiService _apiService;

  UserRepository() : _apiService = ApiService();

  Future<ResponseModel> logInRequest({
    @required String email,
    @required String password,
  }) async {
    try {
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

      if (response.statusCode != 200) {
        throw Exception('Failed to load user');
      }

      return ResponseModel(
        success: true,
        body: User.fromJson(
          json.decode(
            response.body,
          ),
        ),
      );
    } catch (e) {
      return ResponseModel(
        success: false,
        error: e,
      );
    }
  }

  Future<ResponseModel> verifyAuth() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = prefs.getString('authToken');

      if (token == null || token == '') {
        return ResponseModel(
          success: false,
        );
      }

      final response = await _apiService.call(
        type: ApiCallType.get,
        path: 'me',
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load user');
      }

      return ResponseModel(
        success: true,
        body: User.fromJson(
          json.decode(
            response.body,
          ),
        ),
      );
    } catch (error) {
      return ResponseModel(
        success: false,
        error: error,
      );
    }
  }
}
