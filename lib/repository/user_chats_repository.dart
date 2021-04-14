import 'dart:convert';

import '../models/chat.dart';
import '../models/response.dart';
import '../services/api_service.dart';

class UserChatsRepository {
  final ApiService _apiService;

  UserChatsRepository() : _apiService = ApiService();

  Future<ResponseModel> fetchUserChat(String userId) async {
    try {
      final response = await _apiService.call(
        type: ApiCallType.get,
        path: 'myChatsBetween',
        queryParameters: {
          'chatWithUserId': userId,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load user chats');
      }

      final jsonData = json.decode(
        response.body,
      ) as List;

      final List<Chat> chats =
          jsonData.map((chat) => Chat.fromJson(chat)).toList();

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
