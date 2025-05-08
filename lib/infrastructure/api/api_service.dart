import 'dart:convert';

import 'package:app_demo_flutter/core/extensions/string_extension.dart';
import 'package:http/http.dart' as http;
import 'package:app_demo_flutter/domain/common/response.dart';

abstract class ApiService {
  String baseUrl;

  Map<String, String> defaultHeader = {
    'Content-Type': 'application/json'
  };

  ApiService(String url) : baseUrl = url.ensureNoTrailingSlash();

  Future<Response<T>> getAsync<T>(String endpoint, {
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      endpoint = endpoint.ensureLeadingSlash();
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: {...defaultHeader, ...?headers }
      );
      return _handleResponse(response, fromJson);
    } catch (e) {
      return Response<T>(
        isSuccess: false,
        statusCode: -1,
        message: 'Network error: $e',
      );
    }
  }

  Future<Response<T>> postAsync<T>(String endpoint, {
    Map<String, String>? headers,
    Object? body,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      endpoint = endpoint.ensureLeadingSlash();
      final response = await http.post(
          Uri.parse('$baseUrl$endpoint'),
          headers: {...defaultHeader, ...?headers },
          body: body != null ? jsonEncode(body) : null
      );
      return _handleResponse(response, fromJson);
    } catch (e) {
      return Response<T>(
        isSuccess: false,
        statusCode: -1,
        message: 'Network error: $e',
      );
    }
  }

  Future<Response<T>> putAsync<T>(String endpoint, {
    Map<String, String>? headers,
    Object? body,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      endpoint = endpoint.ensureLeadingSlash();
      final response = await http.put(
          Uri.parse('$baseUrl$endpoint'),
          headers: {...defaultHeader, ...?headers },
          body: body != null ? jsonEncode(body) : null
      );
      return _handleResponse(response, fromJson);
    } catch (e) {
      return Response<T>(
        isSuccess: false,
        statusCode: -1,
        message: 'Network error: $e',
      );
    }
  }

  Future<Response<T>> deleteAsync<T>(String endpoint, {
    Map<String, String>? headers,
    Object? body,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      endpoint = endpoint.ensureLeadingSlash();
      final response = await http.delete(
          Uri.parse('$baseUrl$endpoint'),
          headers: {...defaultHeader, ...?headers }
      );
      return _handleResponse(response, fromJson);
    } catch (e) {
      return Response<T>(
        isSuccess: false,
        statusCode: -1,
        message: 'Network error: $e',
      );
    }
  }

  Response<T> _handleResponse<T>(
    http.Response response,
    T Function(Map<String, dynamic>) fromJson
  ) {
    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    final isSuccess = jsonBody['isSuccess'] ?? response.statusCode == 200;
    final statusCode = jsonBody['statusCode'] ?? response.statusCode;
    final message = jsonBody['message'] ?? '';
    final data = jsonBody['data'] != null ? fromJson(jsonBody['data']) : null;

    return Response<T>(
      isSuccess: isSuccess,
      statusCode: statusCode,
      message: message,
      data: data
    );
  }
}