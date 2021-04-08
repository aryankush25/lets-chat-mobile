import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../data_provider/user_data_provider.dart';
import '../models/response.dart';

class UserRepository {
  final UserDataProvider _userDataProvider;

  UserRepository() : _userDataProvider = UserDataProvider();

  Future<ResponseModel> logInRequest({
    @required String email,
    @required String password,
  }) async {
    try {
      final response = await _userDataProvider.logIn(
        email: email,
        password: password,
      );

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

      final response = await _userDataProvider.me();

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
