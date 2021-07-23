import 'package:dio/dio.dart';
import 'package:themoviedb/data/network/constants/end_points.dart';

abstract class NetworkModule {
  static Dio provideDio() {
    final dio = Dio();
    dio
      ..options.baseUrl = Endpoint.baseUrl
      ..options.receiveDataWhenStatusError = true
      ..options.connectTimeout = Endpoint.connectionTimeout
      ..options.receiveTimeout = Endpoint.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(
        LogInterceptor(responseBody: true),
      );
    return dio;
  }
}
