import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

enum ApiCallType { get, post, put, patch, delete }

class ApiService {
  final String _baseUrl;
  final bool _securedServer;

  ApiService()
      : _baseUrl = env['BASE_URL'],
        _securedServer = env['SECURED_URL'] != 'false';

  Future<http.Response> call({
    @required ApiCallType type,
    String path,
    Map<String, String> headers,
    Object body,
    bool withToken = true,
    Map<String, dynamic> queryParameters,
  }) async {
    var apiHeaders = {
      'Content-Type': 'application/json',
    };

    if (withToken) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('authToken');

      if (token != null && token != '') {
        final authHeader = {
          'Authorization': 'Bearer $token',
        };

        apiHeaders = {
          ...apiHeaders,
          ...authHeader,
        };
      }
    }

    if (headers != null && headers.isNotEmpty) {
      apiHeaders = {
        ...apiHeaders,
        ...headers,
      };
    }

    var uri;

    if (_securedServer) {
      uri = Uri.https(
        _baseUrl,
        path,
        queryParameters,
      );
    } else {
      uri = Uri.http(
        _baseUrl,
        path,
        queryParameters,
      );
    }

    var response;

    switch (type) {
      case ApiCallType.get:
        response = await http.get(
          uri,
          headers: apiHeaders,
        );
        break;

      case ApiCallType.post:
        response = await http.post(
          uri,
          headers: apiHeaders,
          body: json.encode(body),
        );
        break;

      default:
        throw Exception('API call type not matching');
        break;
    }

    return response;
  }
}
