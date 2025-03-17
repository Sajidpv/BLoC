import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// ignore: non_constant_identifier_names
Map<String, dynamic> DEFAULT_HEADERS = {"Content-Type": "application/json"};

class API {
  Dio _dio = Dio();
  API() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    _dio.options.headers = DEFAULT_HEADERS;
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }

  Dio get sendRequest => _dio;
}
