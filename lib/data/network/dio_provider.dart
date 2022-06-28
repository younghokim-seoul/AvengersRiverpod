import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/data/network/utlis/custom_logger.dart';



final dioProvider = Provider<Dio>((ref) {

  final Map<String, String> headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
  };


  final dio = Dio(BaseOptions(
    headers: headers,
    connectTimeout: 10000,
  ));
  dio.interceptors.add(CustomInterceptor());
  dio.interceptors.add(CustomLogInterceptor(requestBody: false));
  return dio;
});

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.contentType = 'application/json';
    return super.onRequest(options, handler);
  }
}
