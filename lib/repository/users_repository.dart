import 'dart:convert';

import '../models/user.dart';
import '../models/response.dart';
import '../services/api_service.dart';

class UsersRepository {
  final ApiService _apiService;

  UsersRepository() : _apiService = ApiService();

  Future<ResponseModel> fetchContacts() async {
    try {
      final response = await _apiService.call(
        type: ApiCallType.get,
        path: 'getAllUsers',
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load user');
      }

      final jsonData = json.decode(
        response.body,
      ) as List;

      final List<User> contacts =
          jsonData.map((user) => User.fromJson(user)).toList();

      return ResponseModel(
        success: true,
        body: contacts,
      );
    } catch (error) {
      return ResponseModel(
        success: false,
        error: error,
      );
    }
  }
}
