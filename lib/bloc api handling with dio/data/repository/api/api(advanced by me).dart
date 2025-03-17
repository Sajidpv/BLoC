// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Map<String, dynamic> DEFAULT_HEADERS = {"Content-Type": "application/json"};

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = ' AppConfig.RAW_BASE_URL';
    _dio.options.headers = DEFAULT_HEADERS;

    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  String _createBoundary() {
    final random = Random();
    final boundary = List<int>.generate(24, (index) => random.nextInt(256));
    return '----WebKitFormBoundary' + base64UrlEncode(boundary);
  }

  void setAuthorizationToken() {
    String? AUTH_TOKEN = 'pref.getString(token)';
    _dio.options.headers["Authorization"] = "Bearer $AUTH_TOKEN";
  }

  Future<void> waitForInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    int duration = 0;
    while (connectivityResult == ConnectivityResult.none && duration < 60) {
      await Future.delayed(Duration(seconds: 1));
      duration++;
      connectivityResult = await Connectivity().checkConnectivity();
    }
    if (connectivityResult == ConnectivityResult.none) {
      throw ApiException("No internet connection available.");
    }
  }

  Future<Response> sendRequest(
    String path, {
    String method = "GET",
    dynamic data,
    String? header,
    Map<String, dynamic>? queryParameters,
    bool authorization = false,
  }) async {
    if (authorization) {
      setAuthorizationToken();
    }
    if (header != null) {
      final String boundary = _createBoundary();
      _dio.options.headers['Content-Type'] = '$header; boundary=$boundary';
    } else {
      _dio.options.headers['Content-Type'] = 'application/json';
    }

    await waitForInternetConnectivity();

    try {
      return await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(method: method),
      );
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.receiveTimeout) {
          throw ApiException("Backend not reachable! Contact support.");
        } else if (e.type == DioExceptionType.badResponse) {
          throw ApiException('Internal server error! Try again later.');
        } else {
          throw ApiException("Unexpected error occurred! Try again later.");
        }
      } else {
        throw ApiException("Unexpected error occurred! Try again later.");
      }
    }
  }
}

class ApiResponse {
  bool success;
  dynamic data;
  String? message;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
  });

  factory ApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponse(
      success: data['status'],
      data: data['data'],
      message: data['message'] is String
          ? data['message'] ?? 'Unexpected error'
          : 'Unexpected error occured',
    );
  }
}

class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  @override
  String toString() => message;
}
