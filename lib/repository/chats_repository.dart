import 'dart:convert';

import '../models/user.dart';
import '../models/response.dart';
import '../services/api_service.dart';

class ChatsRepository {
  final ApiService _apiService;

  ChatsRepository() : _apiService = ApiService();

  Future<ResponseModel> fetchChats() async {
    try {
      final response = await _apiService.call(
        type: ApiCallType.get,
        path: 'myInitiatedChatsUsers',
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load user');
      }

      final jsonData = json.decode(
        response.body,
      ) as List;

      final List<User> chats =
          jsonData.map((user) => User.fromJson(user)).toList();

      return ResponseModel(
        success: true,
        body: chats,
      );
    } catch (error) {
      return ResponseModel(
        success: false,
        error: error,
      );
    }
  }
}
